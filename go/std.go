// bytes
bytes.Join(s1, []byte(", "))

bytes.Replace([]byte("oink oink oink"), []byte("k"), []byte("ky"), 2)

bytes.ReplaceAll([]byte("oink oink oink"), []byte("oink"), []byte("moo"))

bytes.Split([]byte("a,b,c"), []byte(","))

bytes.ToLower([]byte("Gopher"))

bytes.ToUpper([]byte("Gopher"))

bytes.Trim([]byte(" !!! Achtung! Achtung! !!! "), "! ")


// md5
h := md5.New()
io.WriteString(h, "The fog is getting thicker!")
io.WriteString(h, "And Leon's getting laaarger!")
fmt.Printf("%x\n", h.Sum(nil))


// strings
strings.Contains("seafood", "foo")

strings.Count("cheese", "e")

before, after, found := strings.Cut(s, sep)

strings.Fields("  foo bar  baz   ")

strings.Index("chicken", "ken")

strings.Join(s2, ", ")

strings.Index("go gopher", "go")
strings.LastIndex("go gopher", "go")

strings.Repeat("na", 2)

strings.Replace("oink oink oink", "k", "ky", 2)
strings.Replace("oink oink oink", "oink", "moo", -1)

strings.Split("a,b,c", ",")

strings.Trim("¡¡¡Hello, Gophers!!!", "!¡")


// strconv
i, err := strconv.Atoi("-42")
s := strconv.Itoa(-42)

str10 := []byte("混合拼接字符串")
str10 = strconv.AppendInt(str10, 4567, 10)
str10 = strconv.AppendBool(str10, true)
str10 = strconv.AppendQuote(str10, "\nsd")
str10 = strconv.AppendQuoteRune(str10, '但')
str10 = strconv.AppendFloat(str10, 3.14, 'E', -1,64)


str11 := strconv.FormatInt(110, 10)
str12 := strconv.FormatBool(false)
str13 := strconv.FormatFloat(3.14, 'g', 12, 64)
str14 := strconv.FormatUint(120, 10)


str15, _ := strconv.ParseInt("123", 10, 64)
str16, _ := strconv.ParseBool("true")
str17, _ := strconv.ParseFloat("3.14", 64)


// os.Create("file.txt")
func main() {
	f, err := os.OpenFile("file.txt", os.O_APPEND | os.O_RDWR, os.ModeAppend)

	nn, err := f.WriteString("world")
	if err != nil {
		fmt.Println(err)
		return
	}
	fmt.Println("write string number is ", nn)
	f.Close()
}

f, err := os.OpenFile("file.txt", os.O_RDWR, 6)
off, err := f.Seek(5, io.SeekStart)
n, err := f.WriteAt([]byte("nice"), off)


fileinfo, err := os.Stat("file.txt")
log.Printf("%T", fileinfo)
log.Println(fileinfo.Name(), fileinfo.Size())


err := os.Mkdir("files", os.ModePerm)
err = os.MkdirAll("files/imgs", os.ModePerm)

os.Remove("file.txt")
os.RemoveAll("files")

// read file
readbytes := make([]byte, 128)

for {
	n, err := f.Read(readbytes)
	if err != nil && err != io.EOF {
		log.Fatalln(err)
	}
	log.Println("read bytes is ", string(readbytes[:n]))
	if n < 128 {
		log.Fatalln("read end!")
	}
}

// 读取一行数据
reader := bufio.NewReader(f)
byt,_ := reader.ReadBytes('\n')
str, err := reader.ReadString('\n')
log.Println(string(byt))
log.Println(str)

writer := bufio.NewWriter(f)
n, err := writer.WriteString("new data write now!")
writer.Flush()


// 读取文件
byt, err := os.ReadFile("file.txt")
err = os.WriteFile("file2.txt",byt, os.ModePerm)



// time
now := time.Now()
customTime := time.Date(2022, 1, 1, 12, 12, 12, 0, time.Local)
now1 := now.Format("2006年01月02日 15:04:05")
strtime := "2011-12-12 12:12:12"
time2, err := time.Parse("2006-01-02 15:04:05", strtime)

year, mon, day := now.Date()
fmt.Println(year,mon,day)
fmt.Println(now.Year())
fmt.Println(now.Month())
fmt.Println(now.Day())
fmt.Println(now.Hour())
fmt.Println(now.Minute())
fmt.Println(now.Second())
fmt.Println(now.Unix())
fmt.Println(now.Add(time.Second * 10))
fmt.Println(now.AddDate(0,1,1))

// 定时器
timer := time.NewTimer(time.Second * 3)
ch := timer.C
fmt.Println(<-ch)

ch2 := time.After(time.Second * 3)
newtime := <-ch2

timer3 := time.NewTimer(time.Second * 3)
go func() {
	<-timer3.C
	fmt.Println("routine in.")
}()


















