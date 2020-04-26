package main

import "fmt"

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





























