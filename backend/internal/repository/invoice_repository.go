package repository

import (
	"database/sql"
	"invoice-backend-app/internal/models"
)

type InvoiceRepository interface {
	GetAll() ([]models.Invoice, error)
	Create(invoice *models.Invoice) error
	// GetByID(id int) (*models.Invoice, error)
	// Update(user *models.Invoice) error
	// Delete(id int) error
}

type invoiceRepository struct {
	db *sql.DB
}

func NewInvoiceRepository(db *sql.DB) InvoiceRepository {
	return &invoiceRepository{db: db}
}

func (r *invoiceRepository) GetAll() ([]models.Invoice, error) {
	invoices := []models.Invoice{}
	query := `SELECT id, invoiceDate, invoiceTime, businessPartner, businessTIN, username, totalAmount, items, quantity, price FROM invoices`
	rows, err := r.db.Query(query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	for rows.Next() {
		var invoice models.Invoice
		if err := rows.Scan(&invoice.ID, &invoice.Username, &invoice.InvoiceDate, &invoice.InvoiceTime, &invoice.BusinessPartner,
			&invoice.BusinessTIN, &invoice.TotalAmount, &invoice.Items, &invoice.Quantity, &invoice.Price,
		); err != nil {
			return nil, err
		}
		invoices = append(invoices, invoice)
	}
	return invoices, nil
}

func (r *invoiceRepository) Create(invoice *models.Invoice) error {
	query := `INSERT INTO invoice (invoiceDate, invoiceTime, businessPartner, businessTIN, flag, username, invoiceNumber UNIQUE, totalAmount, 
	items, quantity, price) VALUES(?,?,?,?,?,?,?,?,?,?,?)`

	result, err := r.db.Exec(query, invoice.InvoiceDate, invoice.InvoiceTime, invoice.BusinessPartner, invoice.BusinessTIN,
		invoice.Flag, invoice.Username, invoice.InvoiceNumber, invoice.TotalAmount, invoice.Items, invoice.Quantity, invoice.Price,
	)

	if err != nil {
		return err
	}

	// Retrieve the last inserted ID
	id, err := result.LastInsertId()
	if err != nil {
		return err
	}

	invoice.ID = int(id) // Set the ID in the item object
	return nil
}
