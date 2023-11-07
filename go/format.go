常用格式化输出：
```
%%	%字面量
%b	二进制整数值，基数为2，或者是一个科学记数法表示的指数为2的浮点数
%c	该值对应的unicode字符
%d	十进制数值，基数为10
%e	科学记数法e表示的浮点或者复数
%E	科学记数法E表示的浮点或者附属
%f	标准计数法表示的浮点或者附属
%o	8进制度
%p	十六进制表示的一个地址值
%s	输出字符串或字节数组
%T	输出值的类型，注意int32和int是两种不同的类型，编译器不会自动转换，需要类型转换。
%v	值的默认格式表示
%+v	类似%v，但输出结构体时会添加字段名
%#v	值的Go语法表示
%t	单词true或false
%q	该值对应的单引号括起来的go语法字符字面值，必要时会采用安全的转义表示
%x	表示为十六进制，使用a-f
%X	表示为十六进制，使用A-F
%U	表示为Unicode格式：U+1234，等价于"U+%04X"
```

示例：
type User struct {
    Name string
    Age int
}
user : = User{
    "overnote",
    1,
}
fmt.Printf("%%\n")                   // %
fmt.Printf("%b\n", 16)               // 10000
fmt.Printf("%c\n", 65)               // A
fmt.Printf("%c\n", 0x4f60)           // 你
fmt.Printf("%U\n", '你')              // U+4f60
fmt.Printf("%x\n", '你')              // 4f60
fmt.Printf("%X\n", '你')              // 4F60
fmt.Printf("%d\n", 'A')              // 65
fmt.Printf("%t\n", 1 > 2)            // false
fmt.Printf("%e\n", 4396.7777777)     // 4.396778e+03 默认精度6位
fmt.Printf("%20.3e\n", 4396.7777777) //            4.397e+03 设置宽度20,精度3,宽度一般用于对齐
fmt.Printf("%E\n", 4396.7777777)     // 4.396778E+03
fmt.Printf("%f\n", 4396.7777777)     // 4396.777778
fmt.Printf("%o\n", 16)               // 20
fmt.Printf("%p\n", []int{1})         // 0xc000016110
fmt.Printf("Hello %s\n", "World")    // Hello World
fmt.Printf("Hello %q\n", "World")    // Hello "World"
fmt.Printf("%T\n", 3.0)              // float64
fmt.Printf("%v\n", user)             // {overnote 1}
fmt.Printf("%+v\n", user)            // {Name:overnote Age:1}
fmt.Printf("%#v\n", user)            // main.User{Name:"overnote", Age:1}

fmt.Println("go" + "lang")
fmt.Println("1+1 =", 1+1)
fmt.Println("7.0/3.0 =", 7.0/3.0)
fmt.Println(true && false)
fmt.Println(true || false)
fmt.Println(!true)



type Celsius float64

const (
  AbsoluteZeroC Celsius = -273.15
  FreezingC Celsius = 0
  BoilingC Celsius = 100
)

func main() {
  fmt.Printf("hello world\n")

  // x := 1
  // p := &x // 指针， 指向x变量，int类型的指针
  // fmt.Println(*p) // 指针 内存地址的值
  // *p = 2
  // fmt.Println(x)

  var a, b int

  fmt.Println(&a == &a, &a == &b, &a == nil)

  v := 1
  incr(&v)
  fmt.Println(incr(&v))

  p := new(int)
  fmt.Println(*p)
  *p = 2
  fmt.Println(*p)

  fmt.Println(newInt())
  fmt.Println(fib(23))
  names := []string{"gold", "silver", "bronze"}
  fmt.Println(names)

  fmt.Println(float64(1.6))

  fmt.Println(AbsoluteZeroC)

  s := "hello world!"
  fmt.Println(s[1:7], "\a")

  str := strings.Join(names, ",")

  fmt.Println(str)
  fmt.Println(strings.Count(str, ","))

  x := 3
  y := fmt.Sprintf("%d", x)
  fmt.Println(y, strconv.Itoa(x))

  r, err := strconv.Atoi("123")
  if err == nil {
    fmt.Println(r)
  }

}


func incr(p *int) int {
  *p++
  return *p
}

func newInt() *int {
  return new(int)
}










