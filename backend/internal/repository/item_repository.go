package repository

import (
	"database/sql"
	"errors"
	"invoice-backend-app/internal/models"
)

type ItemRepository interface {
	GetAll(businessTIN string) ([]models.Item, error)
	Create(item *models.Item, businessTIN string) error
	GetByID(id int, businessTIN string) (*models.Item, error)
	Update(item *models.Item, businessTIN string) error
	// Delete(id int, businessTIN string) error
}

type itemRepository struct {
	db *sql.DB
}

func NewItemRepository(db *sql.DB) ItemRepository {
	return &itemRepository{db: db}
}

func (r *itemRepository) GetAll(businessTIN string) ([]models.Item, error) {
	items := []models.Item{}
	query := `SELECT id, itemCode, itemName, price FROM items`
	rows, err := r.db.Query(query, businessTIN)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	for rows.Next() {
		var item models.Item
		err := rows.Scan(&item.ID, &item.ItemCode, &item.ItemName, &item.Price, &item.IsTaxInclusive, &item.IsTaxable,
			&item.ItemCategory,
		)
		if err != nil {
			return nil, err
		}
		items = append(items, item)
	}
	return items, nil
}

func (r *itemRepository) Create(item *models.Item, businessTIN string) error {
	query := `INSERT INTO items (itemCode, itemName, price, isTaxInclusive, isTaxable, tourismCSTOption) VALUES (?,?,?,?,?,?)`
	result, err := r.db.Exec(query, item.ItemCode, item.ItemName, item.Price, item.IsTaxInclusive, item.IsTaxable,
		item.TourismCstOption,
	)

	if err != nil {
		return err
	}

	// Retrieve the last inserted ID
	id, err := result.LastInsertId()
	if err != nil {
		return err
	}

	item.ID = int(id) // Set the ID in the item object
	item.BusinessTIN = businessTIN
	return nil
}

func (r *itemRepository) GetByID(id int, businessTIN string) (*models.Item, error) {
	item := &models.Item{}
	query := `SELECT id, itemCode, itemName, from items WHERE id = ? AND businessTIN = ?`

	err := r.db.QueryRow(query, id, businessTIN).Scan(&item.ID, &item.ItemCode, &item.ItemName, &item.Price)
	if err != nil {
		if err == sql.ErrNoRows {
			return nil, errors.New("item not found in database")
		}
		return nil, err
	}
	return item, nil
}

func (r *itemRepository) Update(item *models.Item, businessTIN string) error {
	query := `UPDATE item set itemCode = ?, itemName = ?, price = ?, isTaxInclusive = ?, itemDescription = ?, 
	isTaxable = ?, tourismCSTOption = ?, itemCategory = ?, isDiscountable = ?
	WHERE id = ? AND businessTIN = ?`

	_, err := r.db.Exec(query, item.ItemCode, item.ItemName, item.Price, item.IsTaxInclusive, item.ItemDescription,
		item.IsTaxable, item.TourismCstOption, item.ItemCategory, item.IsDiscountable,
	)
	return err
}
