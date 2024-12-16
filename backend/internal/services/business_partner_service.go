package services

import (
	"invoice-backend-app/internal/models"
	"invoice-backend-app/internal/repository"
)

type BusinessPartnerService interface {
	GetAll() ([]models.BusinessPartner, error)
	Create(businessPartner *models.BusinessPartner) error
	GetByID(id int) (*models.BusinessPartner, error)
}

type businessPartnerService struct {
	repo repository.BusinessPartnerRepository
}

func NewBusinessPartnerService(repo repository.BusinessPartnerRepository) BusinessPartnerService {
	return &businessPartnerService{repo: repo}
}

func (s *businessPartnerService) GetAll() ([]models.BusinessPartner, error) {
	return s.repo.GetAll()
}

func (s *businessPartnerService) Create(businessPartner *models.BusinessPartner) error {
	return s.repo.Create(businessPartner)
}

func (s *businessPartnerService) GetByID(id int) (*models.BusinessPartner, error) {
	return s.repo.GetByID(id)
}
