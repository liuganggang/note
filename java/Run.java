public class Run {
  public static void main(String[] args) {
    A a = new A("刘刚", 25);
    a.funcA();
    A b = new A("李飞", 30);
    int i = 1;
    a.funcA(i);
    a.funcA(1,1.0);
    a.talk();
    b.talk();
    A c = new A("张三", 12, "北京");
    System.out.println(c.name);
    System.out.println(c.age);
    System.out.println(c.address);

    A d = new A("李思", 12, "田径", "13146396167");
    System.out.println("name is " + d.name + "age is " + d.age + "address is " + d.address + "tel is " + d.tel );

    B e = new B();
    e.funcA();
    System.out.println(e.name);
  }
}
