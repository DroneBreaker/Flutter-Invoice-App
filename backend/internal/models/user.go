package models

import "time"

type User struct {
	ID          uint      `json:"id" gorm:"primaryKey"`
	Username    string    `json:"username" validate:"required,min=6"`
	BusinessTIN string    `json:"businessTIN" validate:"required,businessTIN" gorm:"unique"`
	Password    string    `json:"password,omitempty" validate:"required,min=6"`
	Role        string    `json:"role" gorm:"default:user"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
}

type TaxpayerLoginRequest struct {
	BusinessTIN string `json:"businessTIN" validate:"required,businessTIN"`
	Username    string `json:"username" validate:"required,username"`
	Password    string `json:"password" validate:"required"`
}

type AuthorityLoginRequest struct {
	Username string `json:"username" validate:"required,username"`
	Password string `json:"password" validate:"required"`
}

type RegisterRequest struct {
	FirstName       string `json:"firstName" validate:"required,min=5"`
	LastName        string `json:"lastName" validate:"required,lastName"`
	BusinessTIN     string `json:"businessTIN" validate:"required,businessTIN" gorm:"unique"`
	Username        string `json:"username" validate:"required,min=6"`
	Password        string `json:"password" validate:"required,min=6"`
	ConfirmPassword string `json:"confirmPassword" validate:"required,min=6"`
}

type Response struct {
	Status  string      `json:"status"`
	Message string      `json:"message"`
	Data    interface{} `json:"data,omitempty"`
}
