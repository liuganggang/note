public class Liugang {
  public static void main(String[] args) {

    Dog d = new Dog();
    d.name = "白色";
    d.talk();
    System.out.println("name is " + d.name);
    new Dog().talk(); // 匿名对象
  }
}

class Dog {
  String name;
  void talk() {
    System.out.println("I am a dog!");
  }
}