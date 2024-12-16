package models

import (
	"time"
)

type Item struct {
	ID               int       `json:"id" xml:"id"`
	ItemCode         int       `json:"itemCode" xml:"itemCode"`
	ItemName         string    `json:"itemName" xml:"itemName"`
	Price            int       `json:"price" xml:"price"`
	IsTaxInclusive   bool      `json:"isTaxInclusive" xml:"isTaxInclusive"`
	ItemDescription  string    `json:"itemDescription" xml:"itemDescription"`
	IsTaxable        bool      `json:"isTaxable" xml:"isTaxable"`
	TourismCstOption string    `json:"tourismCSTOption" xml:"tourismCSTOption"`
	ItemCategory     string    `json:"itemCategory" xml:"itemCategory"`
	IsDiscountable   bool      `json:"isDiscountable" xml:"isDiscountable"`
	CreatedAt        time.Time `json:"created_at" xml:"created_at"`
	BusinessTIN      string    `json:"businessTIN" xml:"businessTIN"`
}
