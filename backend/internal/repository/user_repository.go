package repository

import (
	"database/sql"
	"invoice-backend-app/internal/models"
)

type UserRepository interface {
	GetAll() ([]models.User, error)
	Create(user *models.User) error
	GetByID(id int) (*models.User, error)
	Update(user *models.User) error
	Delete(id int) error
}

type userRepository struct {
	db *sql.DB
}

func NewUserRepository(db *sql.DB) UserRepository {
	return &userRepository{db: db}
}

func (r *userRepository) GetAll() ([]models.User, error) {
	users := []models.User{}
	query := `SELECT id, name, username, businessTIN FROM users`
	rows, err := r.db.Query(query)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	for rows.Next() {
		var user models.User
		if err := rows.Scan(&user.ID, &user.Name, &user.Username, &user.BusinessTIN); err != nil {
			return nil, err
		}
		users = append(users, user)
	}
	return users, nil
}

func (r *userRepository) Create(user *models.User) error {
	query := `INSERT INTO users (name, username, businessTIN, password) VALUES ($1, $2, $3, $4) RETURNING id`
	return r.db.QueryRow(query, user.Name, user.Username, user.BusinessTIN, user.Password).Scan(&user.ID)
}

func (r *userRepository) GetByID(id int) (*models.User, error) {
	user := &models.User{}
	query := `SELECT id, name, businessTIN FROM users WHERE id = $1`
	err := r.db.QueryRow(query, id).Scan(&user.ID, &user.Name, &user.BusinessTIN)
	return user, err
}

func (r *userRepository) Update(user *models.User) error {
	query := `UPDATE users SET name = $1, businessTIN = $2 WHERE id = $3`
	_, err := r.db.Exec(query, user.Name, user.BusinessTIN, user.ID)
	return err
}

func (r *userRepository) Delete(id int) error {
	query := `DELETE FROM users WHERE id = $1`
	_, err := r.db.Exec(query, id)
	return err
}
