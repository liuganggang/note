// go lang
///usr/local/go

go version
// 编译出可执行文件
go build hello.go
// 直接一次性不生成编译文件 运行得到结果
go run hello.go

// install other version go
go get golang.org/dl/go1.10.7

go1.10.7 download

go1.10.7 version


// module

go mod init github/hello
go mod tidy
go run .


// go mod edit -replace github.com/greetings=../greetings
go mod tidy
go run .


// log error
import "log"

log.SetPrefix("greetings: ")
log.SetFlags(0)
log.Fatal(err)


// slice

formats := []string{
  "hi, %v welcome!",
  "good, %v too.",
}
formats[1]

board := [][]string{
    []string{"1","2","3"},
    []string{"11","21","31"},
  }

fmt.Println(board)

// rand
import "math/rand"
rand.Seed(time.Now().UnixNano())
rand.Intn(len(formats))


// make and for
messages := make(map[string]string)
names := []string{"liugang", "zhangsan", "lisi"}

for _, name := range names {
  message, err := greetings.Hello(name)
  messages[name] = message
}


// test

go test -v

import "testing"

func TestHelloName(t *testing.T) {
  name := "liugang"
  want := "liugang"
  msg, err := Hello(name)

  if want == msg || err != nil {
    t.Fatalf(`Hello("liugang") = %q, %v, want == %q, nil`, msg, err, want)
  }
}

// Compile and install the application
go build

go list -f '{{.Target}}'

export PATH=$PATH:/Users/liugang/go/bin

go env -w GOBIN=/Users/liugang/go/bin

go install


// type

type Page struct {
  Title string
  Body []byte
}

// net/http


准备 一台可以翻墙的 windows Shadowsocks 服务端 项目地址:https://github.com/shadowsocks/libQtShadowsocks 下载 2.02 [图片] Shadowsocks 客户端： 安卓下载地址:https://github.com/shadowsocks/shad ..



// goland 设置代理
// GO-> go modules -> Environment,填写 GOPROXY=https://proxy.golang.com.cn,direct

// 命令行 配置 zshrc
export GOPROXY="https://proxy.golang.com.cn,direct"


// 1.18 新加 workspace 模式
go work init ./hello

go work use ./example




// 修改 go.mod 版本，删除go.sum, 重新安装.
go get .

go mod tidy

go list -m -json all




Tutorial: Getting started with fuzzing



go env -w GOBIN=/somewhere/else/bin

go env -u GOBIN

go install example/user/hello


// To remove all downloaded modules, you can pass the -modcache flag to go clean:
go clean -modcache


// ???????
a := [...]string   {Enone: "no error", Eio: "Eio", Einval: "invalid argument"}
s := []string      {Enone: "no error", Eio: "Eio", Einval: "invalid argument"}
m := map[int]string{Enone: "no error", Eio: "Eio", Einval: "invalid argument"}


make([]int, 10, 100)


timeZone := map[string]int{
  "UTC":  0*60*60,
  "PST": -8*60*60,
}
delete(timeZone, "PST")

// 数组
arr := [...]int{1,2,3}

arr2 := [2][4]int{{1,2,3,4}, {4,5,6,7}}

// slice
s := []int {1,2,3}
s := []byte {"a", "b"}

s[:5]// == s[0:5]
s[5:] // == s[5:len(s)]
s[:] // == s[0:len(s)]

slice = array[2:4:7]

// map
rating := map[string]float32{"C": 4, "RUBY": 5, "C//": 4.2}
cplusplus, ok := rating["C++"]
delete(rating, "C")

// chan

ch := make(chan int)
ch := make(chan int, 10)
ch <- 1
i := <- ch
<- ch

ch := make(chan <- string)
ch := make(<-chan string)



func Number(w chan bool) {
  for i=0;i<10; i++ {
    fmt.Println('1')
  }
  w <- true
}

func Word(w chan bool) {
  for i=0;i<10; i++ {
    fmt.Println('1')
  }
  w <- true
}

func main(){
  w1, w2 := make(chan bool), make(chan bool)
  go Number(w1)
  go Word(w2)
  <-w1
  <-w2
}

close(w1)
close(w2)

select {
  case msg := <-ch1:
    fmt.Println("ch1")
  case msg := <-ch2:
    fmt.Println("ch2")
  default:
    fmt.Println("default")
  }

https://www.jetbrains.com/zh-cn/go/download/other.html


// basic-middleware
func logging(f http.HandlerFunc) http.HandlerFunc {
    return func(w http.ResponseWriter, r *http.Request) {
        log.Println(r.URL.Path)
        f(w, r)
    }
}
http.HandleFunc("/foo", logging(foo))



// pointer and address
number := 42
addr := &number
*addr = 33
fmt.Println(number)


var i interface{} = "hello"

s, ok := i.(string)



func do(i interface{}) {
  i.(type)
}

func fib(n int) int {
    x, y := 0, 1
    for i := 0; i < n; i++ {
        x, y = y, x+y
    }
    return x
}

func fibonnacci(n int, ch chan int) {
  x, y := 0, 1
  for i := 0; i < n; i++ {
    ch <- x
    x, y = y, x+y
  }
  close(ch)
}

// generics
type Number interface {
  int64 | float64
}

func SumIntsOrFloats[K comparable, V int64 | float64](m map[K]V) V {
  var s V
  for _, v := range m {
    s += v
  }
  return s
}

func SumNumbers[K comparable, V Number](m map[K]V) V {
  var s V
  for _, v := range m {
    s += v
  }
  return s
}

SumIntsOrFloats[string, int64](ints),
SumIntsOrFloats[string, float64](floats))
SumIntsOrFloats(ints),
SumIntsOrFloats(floats))
SumNumbers(ints),
SumNumbers(floats))


go test

go test -fuzz=Fuzz -fuzztime 30s



strings.Count(s,"")

strings.Index(s,string(v)) != k

unicode.IsLetter(v) == false

strings.Replace(s, " ", "%20", -1)

// Sum(1,2,3) or Sum()
func Sum(nums ...int) int {
    res := 0
    for _, n := range nums {
        res += n
    }
    return res
}

primes := []int{2, 3, 5, 7}
fmt.Println(Sum(primes...)) // 17


// 在一个数组的声明中，...相当于指定一个和元素个数相同的长度
stooges := [...]string{"Moe", "Larry", "Curly"} // len(stooges) == 3



// 这个命令列出当前和子目录中所有的包
go test ./...

go build -race ./race.go
go run -race ./race.go

atomic.AddInt64(&counter, 1)

atomic.LoadInt64(&shutdown)
atomic.StoreInt64(&shutdown, 1)



runner pool work ???





gRPC = google开发的RPC协议
优点： 1、接口有更严格的约束 2、更安全 3、性能更好 。
这3个优点来源于gRPC使用的protobuf（一种数据传输格式和规范）



// Go中计算UTF-8字符串格式的长度应该使用
utf8.RuneCountInString("你好，啊")

// 拼接string，比+更快
var sbr strings.Builder

sbr.WriteString("hello ")
sbr.WriteString(" world!")

log.Println(sbr.String())



// 1.9 并发安全的map
var sence sync.Map
sence.Store("ID", 1)
sence.Store("Name", "lily")
id, _ := sence.Load("ID")
sence.LoadOrStore("ID", 2)

sence.Range(func(k, v interface{}) bool {
  log.Println(k,v)
  return true
})



// 可变参数...
func rawPrint(rawList ...interface{}) {
  for _, a := range rawList {
    log.Println(a)
  }
}
func Print(slist ...interface{}) {
  rawPrint(slist...)
}
Print(1,2,3)


// 函数去掉函数名、参数名和{}后的结果即是函数类型，可以使用%T打印该结果。
// 两个函数类型相同的前提是：拥有相同的形参列表和返回值列表，且列表元素的次序、类型都相同，形参名可以不同。
func mathSum(a, b int) int {
  return a + b
}

func mathSub(a, b int) int {
  return a - b
}

type MyMath func(int,int) int

func TestMath(f MyMath, a, b int) int {
  return f(a,b)
}

sum1 := TestMath(mathSum, 1, 1)
sub1 := TestMath(mathSub, 4, 1)





























