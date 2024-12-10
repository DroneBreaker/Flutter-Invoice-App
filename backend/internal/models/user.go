package models

import "time"

type User struct {
	ID          int       `json:"id" xml:"id"`
	Name        string    `json:"name" xml:"name"`
	Username    string    `json:"username" validate:"required,min=6" xml:"username"`
	BusinessTIN string    `json:"businessTIN" validate:"required,businessTIN" xml:"businessTIN"`
	Password    string    `json:"password,omitempty" validate:"required,min=6" xml:"password"`
	Role        string    `json:"role" xml:"role"`
	CreatedAt   time.Time `json:"created_at" xml:"created_at"`
	UpdatedAt   time.Time `json:"updated_at" xml:"updated_at"`
}
