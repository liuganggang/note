
// embedded & embeddedPrefix
type Product struct {
	gorm.Model
	Code string
	Price uint
}

type Author struct {
	Name string
	Email string
}

type SellProduct struct {
	Product Product `gorm:"embedded"`
	Author Author `gorm:"embedded;embeddedPrefix:author_"`
	SellPrice uint
}


// mysql

dsn := "root:@tcp(127.0.0.1:3306)/recordings?charset=utf8mb4&parseTime=True&loc=Local"
db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})














































































