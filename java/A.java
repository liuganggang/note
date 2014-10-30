class A {

  String name;
  int age;
  String address;
  String tel;

  static {
    System.out.println("这是一个静态代码快!");
  };

  static int i = 1;

  static void funcB() {
    System.out.println("这是一个静态函数!");
  }

  A() {

  };

  A(String n, int a) {
    this.name = n;
    this.age = a;
    System.out.println("构造函数内部!");
  };

  A(String n, int a, String addr) {
    this(n, a);
    this.address = addr;
  };

  A(String n, int a, String addr, String tel) {
    this(n, a, addr);
    this.tel = tel;
  };

  void funcA() {
    System.out.println("这是一个没有参数的function.");
  }

  void funcA(int i) {
    System.out.println("这是一个有参数的function.");
  }

  void funcA(int i,double j) {
    System.out.println("这是一个有2参数的function.");
  }

  void talk() {
    System.out.println("name is " + this.name + "age is " + this.age);
  }
}