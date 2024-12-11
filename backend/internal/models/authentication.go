package models

type TaxpayerLoginRequest struct {
	BusinessTIN string `json:"businessTIN" xml:"businessTIN" validate:"required,businessTIN"`
	Username    string `json:"username" xml:"username" validate:"required,username"`
	Password    string `json:"password" validate:"required"`
	Cookie      string `json:"cookie"`
}

type AuthorityLoginRequest struct {
	Username string `json:"username" validate:"required,username"`
	Password string `json:"password" validate:"required"`
	Cookie   string `json:"cookie"`
}

type RegisterRequest struct {
	FirstName       string `json:"firstName" validate:"required,min=5"`
	LastName        string `json:"lastName" validate:"required,lastName"`
	BusinessTIN     string `json:"businessTIN" validate:"required,businessTIN" gorm:"unique"`
	Username        string `json:"username" validate:"required,min=6"`
	Password        string `json:"password" validate:"required,min=6"`
	ConfirmPassword string `json:"confirmPassword" validate:"required,min=6 -"`
}
