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


go mod edit -replace github.com/greetings=../greetings
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




























































