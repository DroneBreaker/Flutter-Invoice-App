package servicesxx

// import (
// 	"errors"
// 	"invoice-backend-app/internal/models"
// )

// type UserService struct {
// 	userRepo *repository.UserRepository
// }

// func NewUserService(ur *repository.UserRepository) *UserService {
// 	return &UserService{userRepo: ur}
// }

// func (s *UserService) Register(req *domain.RegisterRequest) (*domain.User, error) {
// 	// Check if user exists
// 	exists, _ := s.userRepo.FindByEmail(req.Email)
// 	if exists != nil {
// 		return nil, errors.New("email already registered")
// 	}

// 	// Hash password
// 	hashedPassword, err := utils.HashPassword(req.Password)
// 	if err != nil {
// 		return nil, err
// 	}

// 	user := &models.User{
// 		Username:    req.username,
// 		BusinessTIN: req.businessTIN,
// 		Password:    hashedPassword,
// 	}

// 	if err := s.userRepo.Create(user); err != nil {
// 		return nil, err
// 	}

// 	return user, nil
// }

// func (s *UserService) Login(req *models.TaxpayerLoginRequest) (string, error) {
// 	user, err := s.userRepo.FindByEmail(req.Email)
// 	if err != nil {
// 		return "", errors.New("invalid credentials")
// 	}

// 	if !utils.CheckPassword(req.Password, user.Pasmodels) {
// 		return "", errors.New("invalid credentials")
// 	}

// 	token, err := utils.GenerateToken(user.ID)
// 	if err != nil {
// 		return "", err
// 	}

// 	return token, nil
// }
