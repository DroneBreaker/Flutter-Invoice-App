package handlers

import (
	"invoice-backend-app/internal/models"
	"invoice-backend-app/internal/services"
	"net/http"
	"strconv"

	"github.com/labstack/echo/v4"
)

type BusinessPartnerHandler struct {
	businessPartnerService services.BusinessPartnerService
}

func NewBusinessPartnerHandler(businessPartnerService services.BusinessPartnerService) *BusinessPartnerHandler {
	return &BusinessPartnerHandler{businessPartnerService: businessPartnerService}
}

func (h *BusinessPartnerHandler) GetAll(c echo.Context) error {
	businessPartners, err := h.businessPartnerService.GetAll()
	if err != nil {
		return c.JSON(http.StatusInternalServerError, err.Error())
	}
	return c.JSON(http.StatusOK, businessPartners)
}

func (h *BusinessPartnerHandler) Create(c echo.Context) error {
	businessPartner := new(models.BusinessPartner)
	if err := c.Bind(businessPartner); err != nil {
		return c.JSON(http.StatusBadRequest, err.Error())
	}

	if err := h.businessPartnerService.Create(businessPartner); err != nil {
		return c.JSON(http.StatusInternalServerError, err.Error())
	}
	return c.JSON(http.StatusCreated, businessPartner)
}

func (h *BusinessPartnerHandler) GetByID(c echo.Context) error {
	id, err := strconv.Atoi(c.Param("id"))
	if err != nil {
		return c.JSON(http.StatusBadRequest, err.Error())
	}

	businessPartner, err := h.businessPartnerService.GetByID(id)
	if err != nil {
		return c.JSON(http.StatusNotFound, err.Error())
	}
	return c.JSON(http.StatusOK, businessPartner)
}
