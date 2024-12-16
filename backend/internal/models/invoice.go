package models

import (
	"time"
)

type Invoice struct {
	ID              int       `json:"id"`
	InvoiceDate     time.Time `json:"invoiceDate" xml:"invoiceDate"`
	InvoiceTime     time.Time `json:"TransactionTime" xml:"TransactionTime"`
	Flag            string    `json:"flag" xml:"flag"`
	BusinessPartner string    `json:"businessPartner" xml:"businessPartner"`
	BusinessTIN     string    `json:"businessTIN" xml:"businessTIN"`
	Username        string    `json:"username" xml:"username"`
	InvoiceNumber   string    `json:"invoiceNumber" xml:"invoiceNumber"`
	TotalAmount     int       `json:"totalAmount" xml:"totalAmount"`
	Items           []Item    `json:"items" xml:"items"`
	Quantity        int       `json:"quantity" xml:"quantity"`
	Price           int       `json:"price" xml:"price"`
}

// type Items struct {
// 	ItemCode        string `json:"itemCode" xml:"itemCode"`
// 	ItemDescription string `json:"itemDescription" xml:"itemDescription"`
// 	ItemName        string `json:"itemName" xml:"itemName"`
// 	Price           int    `json:"price" xml:"price"`
// 	Quantity        int    `json:"quantity" xml:"quantity"`
// }
