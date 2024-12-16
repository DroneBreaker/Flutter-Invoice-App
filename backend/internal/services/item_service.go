package services

import (
	"invoice-backend-app/internal/models"
	"invoice-backend-app/internal/repository"
)

type ItemService interface {
	GetAll(businessTIN string) ([]models.Item, error)
	Create(item *models.Item, businessTIN string) error
	GetByID(id int, businessTIN string) (*models.Item, error)
	// Update(item *models.Item, businessTIN string) error
	// Delete(id int) error
}

type itemService struct {
	repo repository.ItemRepository
}

func NewItemService(repo repository.ItemRepository) ItemService {
	return &itemService{repo: repo}
}

func (s *itemService) GetAll(businessTIN string) ([]models.Item, error) {
	return s.repo.GetAll(businessTIN)
}

func (s *itemService) Create(item *models.Item, businessTIN string) error {
	return s.repo.Create(item, businessTIN)
}

func (s *itemService) GetByID(id int, businessTIN string) (*models.Item, error) {
	return s.repo.GetByID(id, businessTIN)
}
