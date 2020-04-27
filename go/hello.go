package main

import (
  "fmt"
  "strings"
  "strconv"
)

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

func fib(n int) int {
    x, y := 0, 1
    for i := 0; i < n; i++ {
        x, y = y, x+y
    }
    return x
}





























