package main

import (
  "fmt"
  "os"
  "strings"
)


func main() {

  var bi string = "bi"
  var names []string
  fmt.Println(bi)
  fmt.Println(len(names))

  fmt.Println(strings.Join(os.Args[1:], " "))
  // fmt.Println(os.Args[1:])

  fmt.Printf("like you %g = %g ", like(1.0), 2.0)

  var e error
  var p Point
  i,j := 1,0
  i,j = j,i

  f, err = os.Open(name)

  if f != nil {
    return err
  }
  f.close()

  in, err := os.Open(name)
  out, err := os.Create(name) // 第二次赋值。 必须其中有一个参数是已经初始过了的才能赋值

}

func like(i float64) float64 {
  return i + 1
}
