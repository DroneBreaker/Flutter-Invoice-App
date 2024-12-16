package main

import (
	"database/sql"
	"fmt"
	"invoice-backend-app/internal/handlers"
	"invoice-backend-app/internal/repository"
	"invoice-backend-app/internal/services"
	"log"

	_ "github.com/go-sql-driver/mysql"
	"github.com/labstack/echo/v4"
)

func main() {
	db, err := sql.Open("mysql", "root:DroneBreaker55@tcp(localhost:3306)/invoicify")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	e := echo.New()

	userRepo := repository.NewUserRepository(db)
	userService := services.NewUserService(userRepo)
	userHandler := handlers.NewUserHandler(userService)

	itemRepo := repository.NewItemRepository(db)
	itemService := services.NewItemService(itemRepo)
	itemHandler := handlers.NewItemHandler(itemService)

	businessPartnerRepo := repository.NewBusinessPartnerRepository(db)
	businessPartnerService := services.BusinessPartnerService(businessPartnerRepo)
	businessPartnerHandler := handlers.NewBusinessPartnerHandler(businessPartnerService)

	//  User Routes
	e.GET("/users", userHandler.GetAll)
	e.POST("/users", userHandler.Create)
	e.GET("/users/:id", userHandler.GetByID)
	e.PUT("/users/:id", userHandler.Update)
	e.DELETE("/users/:id", userHandler.Delete)

	// Item Routes
	e.GET("/items", itemHandler.GetAll)
	e.POST("/items", itemHandler.Create)
	e.GET("items/:id", itemHandler.GetByID)

	// Business Partner Routes
	e.GET("/partners", businessPartnerHandler.GetAll)
	e.POST("/partners", businessPartnerHandler.Create)
	e.GET("/partners/:id", businessPartnerHandler.GetByID)

	//Middleware
	// g := e.Group("/taxpayer")
	// g.Use(middleware.)

	e.Logger.Fatal(e.Start(":4000"))
	fmt.Println("Hi, welcome to my backend")
}
