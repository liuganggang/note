# go lang
#/usr/local/go

go version
# 编译出可执行文件
go build hello.go
# 直接一次性不生成编译文件 运行得到结果
go run hello.go

# install other version go
go get golang.org/dl/go1.10.7

go1.10.7 download

go1.10.7 version


# module

go mod init github/hello
go mod tidy
go run .


# go mod edit -replace github.com/greetings=../greetings
go mod tidy
go run .


# log error
import "log"

log.SetPrefix("greetings: ")
log.SetFlags(0)
log.Fatal(err)


# slice

formats := []string{
  "hi, %v welcome!",
  "good, %v too.",
}
formats[1]

# rand
import "math/rand"
rand.Seed(time.Now().UnixNano())
rand.Intn(len(formats))


# make and for
messages := make(map[string]string)
names := []string{"liugang", "zhangsan", "lisi"}

for _, name := range names {
  message, err := greetings.Hello(name)
  messages[name] = message
}


# test

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

# Compile and install the application
go build

go list -f '{{.Target}}'

export PATH=$PATH:/Users/liugang/go/bin

go env -w GOBIN=/Users/liugang/go/bin

go install


# type

type Page struct {
  Title string
  Body []byte
}

# net/http


准备 一台可以翻墙的 windows Shadowsocks 服务端 项目地址:https://github.com/shadowsocks/libQtShadowsocks 下载 2.02 [图片] Shadowsocks 客户端： 安卓下载地址:https://github.com/shadowsocks/shad ..



# goland 设置代理
# GO-> go modules -> Environment,填写 GOPROXY=https://proxy.golang.com.cn,direct

# 命令行 配置 zshrc
export GOPROXY="https://proxy.golang.com.cn,direct"


# 1.18 新加 workspace 模式
go work init ./hello

go work use ./example




# 修改 go.mod 版本，删除go.sum, 重新安装.
go get .

go mod tidy

go list -m -json all



# 1.18 ???
Tutorial: Getting started with generics

Tutorial: Getting started with fuzzing



go env -w GOBIN=/somewhere/else/bin

go env -u GOBIN

go install example/user/hello


# To remove all downloaded modules, you can pass the -modcache flag to go clean:
go clean -modcache


# ???????
a := [...]string   {Enone: "no error", Eio: "Eio", Einval: "invalid argument"}
s := []string      {Enone: "no error", Eio: "Eio", Einval: "invalid argument"}
m := map[int]string{Enone: "no error", Eio: "Eio", Einval: "invalid argument"}

# ???????
make([]int, 10, 100)


timeZone := map[string]int{
  "UTC":  0*60*60,
  "PST": -8*60*60,
}
delete(timeZone, "PST")

# 数组
arr := [...]int{1,2,3}

arr2 := [2][4]int{{1,2,3,4}, {4,5,6,7}}

# slice
s := []int {1,2,3}
s := []byte {"a", "b"}

s[:5]# == s[0:5]
s[5:] # == s[5:len(s)]
s[:] # == s[0:len(s)]

slice = array[2:4:7]

# map
rating := map[string]float32{"C": 4, "RUBY": 5, "C#": 4.2}
cplusplus, ok := rating["C++"]
delete(rating, "C")





