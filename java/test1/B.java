class B {
  public void func(A a) {
    System.out.println("内部类对象");
    a.doSomething();
  }
}