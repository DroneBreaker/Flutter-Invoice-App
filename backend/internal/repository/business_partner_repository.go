package repository

import (
	"database/sql"
	"invoice-backend-app/internal/models"
)

type BusinessPartnerRepository interface {
	GetAll() ([]models.BusinessPartner, error)
	Create(businessPartner *models.BusinessPartner) error
	GetByID(id int) (*models.BusinessPartner, error)
}

type businessPartnerRepository struct {
	db *sql.DB
}

func NewBusinessPartnerRepository(db *sql.DB) BusinessPartnerRepository {
	return &businessPartnerRepository{db: db}
}

func (r *businessPartnerRepository) GetAll() ([]models.BusinessPartner, error) {
	businessPartners := []models.BusinessPartner{}
	query := `SELECT businessPartnerID, businessPartnerName, businessPartnerTIN, 
	businessPartnerEmail, businessPartnerContact FROM business_partners`
	rows, err := r.db.Query(query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	for rows.Next() {
		var businessPartner models.BusinessPartner
		err := rows.Scan(&businessPartner.BusinessPartnerID, &businessPartner.Name,
			&businessPartner.BusinessPartnerTIN, &businessPartner.Email, &businessPartner.Phone)
		if err != nil {
			return nil, err
		}
		businessPartners = append(businessPartners, businessPartner)
	}

	return businessPartners, nil
}

func (r *businessPartnerRepository) Create(businessPartner *models.BusinessPartner) error {
	query := `INSERT INTO business_partners (businessPartnerID, businessPartnerName, businessPartnerTIN, businessPartnerEmail, 
	businessPartnerContact) VALUES(?,?,?,?,?)`
	result, err := r.db.Exec(query, businessPartner.BusinessPartnerID, businessPartner.Name, businessPartner.BusinessPartnerTIN, businessPartner.Email, businessPartner.Phone)

	if err != nil {
		return err
	}

	// Retrieve the last inserted ID
	businessPartnerID, err := result.LastInsertId()
	if err != nil {
		return err
	}

	businessPartner.BusinessPartnerID = int(businessPartnerID) // Set the ID in the businessPartner object
	return nil
}

func (r *businessPartnerRepository) GetByID(id int) (*models.BusinessPartner, error) {
	businessPartner := &models.BusinessPartner{}
	query := `SELECT businessPartnerID, businessPartnerName, businessPartnerTIN, businessPartnerEmail, businessPartnerContact WHERE businessPartnerID = ?`

	err := r.db.QueryRow(query, businessPartner.BusinessPartnerID).Scan(&businessPartner.BusinessPartnerID, &businessPartner.Name, &businessPartner.BusinessPartnerTIN, &businessPartner.Email, &businessPartner.Phone)
	// if err != nil {
	// 	if err == sql.ErrNoRows {
	// 		return nil, errors.New("item not found in database")
	// 	}
	// 	return nil, err
	// }
	return businessPartner, err
}

// func (r *userRepository) Update(user *models.User) error {
// 	query := `UPDATE users SET name = ?, businessTIN = ? WHERE id = ?`
// 	_, err := r.db.Exec(query, user.Name, user.BusinessTIN, user.ID)
// 	return err
// }

// func (r *userRepository) Delete(id int) error {
// 	query := `DELETE FROM users WHERE id = ?`
// 	_, err := r.db.Exec(query, id)
// 	return err
// }
