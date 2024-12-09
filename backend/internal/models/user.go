package models

import "time"

type User struct {
	ID          int       `json:"id" mysql:"primaryKey"`
	Name        string    `json:"name"`
	Username    string    `json:"username" validate:"required,min=6"`
	BusinessTIN string    `json:"businessTIN" validate:"required,businessTIN" gorm:"unique"`
	Password    string    `json:"password,omitempty" validate:"required,min=6"`
	Role        string    `json:"role" mysql:"default:user"`
	CreatedAt   time.Time `json:"created_at"`
	UpdatedAt   time.Time `json:"updated_at"`
}
