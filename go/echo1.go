// ./echo1 liu gang gang hello
package main

// 导入包
import (
  "fmt"
  "os"
)

func main() {
  // 声明 string变量
  var s, sep string
  // 拼接string
  for i := 1; i < len(os.Args); i++ {
    s += sep + os.Args[i]
    sep = " "
  }

  fmt.Println(s)
}

