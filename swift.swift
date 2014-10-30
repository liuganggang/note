println("Hello, world")

let liugang = "liugang"
var name = "name"
name = "2name"

// 声明变量类型
let explicitDouble: Double = 70
let apples = 3
// 使用变量
let appleSummary = "I have \(apples) apples."

// 创建数组, Hash
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

// 创建空数组
let emptyArray = String[]()
let emptyDictionary = Dictionary<String, Float>()

// switch
let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
}

// for 范围
var firstForLoop = 0
for i in 0..3 {
    firstForLoop += i
}
firstForLoop

var secondForLoop = 0
for var i = 0; i < 3; ++i {
    secondForLoop += 1
}
secondForLoop


// 创建一个函数
func greet(name: String, age: Int) -> String {
  return "Hello,\(name)!you are \(age) years_old."
}

let caller: String = greet("liugang",25)
println(caller)

func get_lots() -> (String,String,String) {
  return ("liugang", "lig","ali")
}

func sum_no_of(numbers: Int...) -> Int {
  var sum = 0
  for number in numbers {
    sum += number
  }
  return sum
}

// 创建一个类
class Shape {
  var numberofsides = 0
  func shapedesc() -> String {
    return "hello,now shape you \(numberofsides)."
  }
}

var shape = Shape()
let shape_side = shape.numberofsides
let shape_desc = shape.shapedesc()
println(shape_side)
println(shape_desc)



















