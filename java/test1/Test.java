class Test {
  public static void main(String[] args) {
    // AIpl apl = new AIpl();
    // A a = apl;
    B b = new B();

    b.func(new A() {
      public void doSomething() {
        System.out.println("实现内部类");
      }
    });

    C c = new C();
    C.D d = c.new D();
    c.i = 4;
    d.j = 6;
    System.out.println(d.do_puls());
  }
}