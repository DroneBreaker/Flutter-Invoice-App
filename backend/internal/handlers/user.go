package handlers

// import (
// 	"invoice-backend-app/internal/models"
// 	"invoice-backend-app/internal/services"
// 	"net/http"

// 	"github.com/labstack/echo/v4"
// )

// type UserHandler struct {
// 	userService *services.UserService
// }

// func NewUserHandler(us *services.UserService) *UserHandler {
// 	return &UserHandler{userService: us}
// }

// func (h *UserHandler) Register(c echo.Context) error {
// 	req := new(models.RegisterRequest)
// 	if err := c.Bind(req); err != nil {
// 		return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid request"})
// 	}

// 	user, err := h.userService.Register(req)
// 	if err != nil {
// 		return c.JSON(http.StatusBadRequest, map[string]string{"error": err.Error()})
// 	}

// 	return c.JSON(http.StatusCreated, user)
// }

// func (h *UserHandler) TaxpayerLogin(c echo.Context) error {
// 	req := new(models.TaxpayerLoginRequest)
// 	if err := c.Bind(req); err != nil {
// 		return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid request"})
// 	}

// 	token, err := h.userService.Login(req)
// 	if err != nil {
// 		return c.JSON(http.StatusUnauthorized, map[string]string{"error": "Invalid credentials"})
// 	}

// 	return c.JSON(http.StatusOK, map[string]string{"token": token})
// }

// func (h *UserHandler) AuthorityLogin(c echo.Context) error {
// 	req := new(models.AuthorityLoginRequest)
// 	if err := c.Bind(req); err != nil {
// 		return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid request"})
// 	}

// 	token, err := h.userService.Login(req)
// 	if err != nil {
// 		return c.JSON(http.StatusUnauthorized, map[string]string{"error": "Invalid credentials"})
// 	}

// 	return c.JSON(http.StatusOK, map[string]string{"token": token})
// }
