package handlers

import (
	"invoice-backend-app/internal/models"
	"invoice-backend-app/internal/services"
	"net/http"
	"strconv"

	"github.com/labstack/echo/v4"
)

type ItemHandler struct {
	itemService services.ItemService
}

func NewItemHandler(itemService services.ItemService) *ItemHandler {
	return &ItemHandler{itemService: itemService}
}

func (h *ItemHandler) GetAll(c echo.Context) error {
	// Safely check if user exists in context
	userInterface := c.Get("user")
	if userInterface == nil {
		return c.JSON(http.StatusUnauthorized, map[string]string{
			"error": "user not authenticated",
		})
	}

	// Safely perform type assertion
	user, ok := userInterface.(models.User)
	if !ok {
		return c.JSON(http.StatusInternalServerError, map[string]string{
			"error": "invalid user type in context",
		})
	}

	// Get businessTIN from authenticated user
	// businessTIN := c.Get("user").(models.User).BusinessTIN

	items, err := h.itemService.GetAll(user.BusinessTIN)
	if err != nil {
		return c.JSON(http.StatusInternalServerError, err.Error())
	}
	return c.JSON(http.StatusOK, items)
}

func (h *ItemHandler) Create(c echo.Context) error {
	item := new(models.Item)
	if err := c.Bind(item); err != nil {
		return c.JSON(http.StatusBadRequest, err.Error())
	}

	// businessTIN := c.Get("user").(models.User).BusinessTIN

	if err := h.itemService.Create(item, c.Param("businessTIN")); err != nil {
		return c.JSON(http.StatusInternalServerError, err.Error())
	}
	return c.JSON(http.StatusCreated, item)
}

func (h *ItemHandler) GetByID(c echo.Context) error {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		return c.JSON(http.StatusBadRequest, err.Error())
	}

	// businessTIN := c.Get("user").(models.User).BusinessTIN

	item, err := h.itemService.GetByID(id, c.Param("businessTIN"))
	if err != nil {
		return c.JSON(http.StatusNotFound, err.Error())
	}
	return c.JSON(http.StatusOK, item)
}

// func (h *ItemHandler) Update(c echo.Context) error {
// 	id, err := strconv.Atoi(c.Param("id"))
// 	if err != nil {
// 		return c.JSON(http.StatusBadRequest, err.Error())
// 	}

// 	item := new(models.Item)
// 	if err := c.Bind(item); err != nil {
// 		return c.JSON(http.StatusBadRequest, err.Error())
// 	}
// 	item.ID = id

// 	businessTIN := c.Get("user").(models.User).BusinessTIN

// 	if err := h.itemService.Update(item, businessTIN); err != nil {
// 		return c.JSON(http.StatusInternalServerError, err.Error())
// 	}
// 	return c.JSON(http.StatusOK, item)
// }

// func (h *ItemHandler) Delete(c echo.Context) error {
// 	id, err := strconv.Atoi(c.Param("id"))
// 	if err != nil {
// 		return c.JSON(http.StatusBadRequest, err.Error())
// 	}

// 	businessTIN := c.Get("user").(models.User).BusinessTIN

// 	if err := h.itemService.Delete(id, businessTIN); err != nil {
// 		return c.JSON(http.StatusInternalServerError, err.Error())
// 	}
// 	return c.NoContent(http.StatusNoContent)
// }
