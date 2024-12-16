package models

import "time"

type BusinessPartner struct {
	BusinessPartnerID  int       `json:"businessPartnerID" xml:"businessPartnerID"`
	Name               string    `json:"businessPartnerName" xml:"businessPartnerName"`
	BusinessPartnerTIN string    `json:"businessPartnerTIN" xml:"businessPartnerTIN"`
	Email              string    `json:"businessPartnerEmail" xml:"businessPartnerEmail"`
	Phone              int       `json:"businessPartnerContact" xml:"businessPartnerContact"`
	CreatedAt          time.Time `json:"createdAt" xml:"createdAt"`
}
