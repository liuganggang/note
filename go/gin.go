go build -tags=jsoniter .

go build -tags=go_json .

go build -tags=nomsgpack .

// *gin.Context
c.JSON(http.StatusOK, gin.H{"message": "pong"})

c.String(http.StatusOK, "Hello %s", name)


name, action := c.Param("name"), c.Param("action")

b := c.FullPath() == "/user/:name/*action"

firstname := c.DefaultQuery("firstname", "Guest")
lastname := c.Query("lastname")

// Multipart/Urlencoded Form
message := c.PostForm("message")
nick := c.DefaultPostForm("nick", "nick")


ids := c.QueryMap("ids")
names := c.PostFormMap("names")


// router Group
v1 := r.Group("/v1")
{
	v1.POST("/upload", uploadEndpoint)
	v1.POST("/submit", submitEndpoint)
}

v2 := r.Group("/v2")
{
	v2.POST("/upload", uploadEndpoint)
	v2.POST("/submit", submitEndpoint)
}

// Validator

type Login struct {
	User string `form:"user" json:"user" xml:"user" binding:"required"`
	Password string `form:"password" json:"password" xml:"password" binding:"required"`
}

err := c.ShouldBindJSON(&json)

type Booking struct {
	CheckIn  time.Time `form:"check_in" binding:"required,bookabledate" time_format:"2006-01-02"`
	CheckOut time.Time `form:"check_out" binding:"required,gtfield=CheckIn" time_format:"2006-01-02"`
}

if c.ShouldBindQuery(&person) == nil {
	log.Println("====== Only Bind By Query String ======")
	log.Println(person.Name)
	log.Println(person.Address)
}


err := c.ShouldBind(&form)

type Person struct {
	ID string `uri:"id" binding:"required,uuid"`
	Name string `uri:"name" binding:"required"`
}

route.GET("/:name/:id", func(c *gin.Context) {
	var person Person
	if err := c.ShouldBindUri(&person); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"msg": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"name": person.Name, "uuid": person.ID})
})



type myForm struct {
    Colors []string `form:"colors[]"`
}

func formHandler(c *gin.Context) {
    var fakeForm myForm
    c.ShouldBind(&fakeForm)
    c.JSON(http.StatusOK, gin.H{"color": fakeForm.Colors})
}


type ProfileForm struct {
	Name   string                `form:"name" binding:"required"`
	Avatar *multipart.FileHeader `form:"avatar" binding:"required"`

	// or for multiple files
	// Avatars []*multipart.FileHeader `form:"avatar" binding:"required"`
}

if err := c.ShouldBind(&form); err != nil {
			c.String(http.StatusBadRequest, "bad request")
			return
		}

		err := c.SaveUploadedFile(form.Avatar, form.Avatar.Filename)
		if err != nil {
			c.String(http.StatusInternalServerError, "unknown error")
			return
		}

r.SecureJsonPrefix(")]}',\n")
v1.GET("/secureJSON", func(c *gin.Context) {
	names := []string{"lena", "austin", "foo"}

	// Will output  :   while(1);["lena","austin","foo"]
	c.SecureJSON(http.StatusOK, names)
})

v1.GET("/JSONP", func(c *gin.Context) {
		data := gin.H{
			"foo": "bar",
		}

		//callback is x
		// Will output  :   x({\"foo\":\"bar\"})
		c.JSONP(http.StatusOK, data)
	})

// Serves unicode entities
	r.GET("/json", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"html": "<b>Hello, world!</b>",
		})
	})

	// Serves literal characters
	r.GET("/purejson", func(c *gin.Context) {
		c.PureJSON(http.StatusOK, gin.H{
			"html": "<b>Hello, world!</b>",
		})
	})

router.Static("/assets", "./assets")
router.StaticFS("/more_static", http.Dir("my_file_system"))
router.StaticFile("/favicon.ico", "./resources/favicon.ico")
router.StaticFileFS("/more_favicon.ico", "more_favicon.ico", http.Dir("my_file_system"))


v1.GET("/local/file", func(c *gin.Context) {
		c.File("/Users/liugang/work/gin-web/main.go")
	})

v1.GET("/someDataFromReader", func(c *gin.Context) {
		response, err := http.Get("https://raw.githubusercontent.com/gin-gonic/logo/master/color.png")
		if err != nil || response.StatusCode != http.StatusOK {
			c.Status(http.StatusServiceUnavailable)
			return
		}

		reader := response.Body
		defer reader.Close()
		contentLength := response.ContentLength
		contentType := response.Header.Get("Content-Type")

		extraHeaders := map[string]string{
			"Content-Disposition": `attachment; filename="gopher.png"`,
		}

		c.DataFromReader(http.StatusOK, contentLength, contentType, reader, extraHeaders)
	})

r.LoadHTMLGlob("templates/**/*")

v1.GET("posts/index", func(c *gin.Context) {
		c.HTML(http.StatusOK, "posts/index.tmpl", gin.H{
			"title": "new website for posts",
		})
	})

r.Delims("{[{", "}]}")

v1.GET("/baidu", func(c *gin.Context) {
		c.Redirect(http.StatusMovedPermanently, "http://www.baidu.com/")
	})


v1.GET("/google", func(c *gin.Context) {
		c.Request.URL.Path = "/v1/bing"
		r.HandleContext(c)
	})
	v1.GET("/bing", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"hello": "bing"})
	})



v1.GET("/long_async", func(c *gin.Context) {
		cCp := c.Copy()
		go func() {
			time.Sleep( 5 * time.Second)
			log.Println("Done! in path " + cCp.Request.URL.Path)
		}()
	})

	v1.GET("/long_sync", func(c *gin.Context) {
		// simulate a long task with time.Sleep(). 5 seconds
		time.Sleep(5 * time.Second)

		// since we are NOT using a goroutine, we do not have to copy the context
		log.Println("Done! in path " + c.Request.URL.Path)
	})


cookie, err := c.Cookie("gin_cookie")

c.SetCookie("gin_cookie", "test", 3600, "/", "localhost", false, true)
















































