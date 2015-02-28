class Test {
  public static void main(String[] args) {
    RunnableImpl ri = new RunnableImpl();
    Thread t = new Thread(ri);
    t.setPriority(Thread.MAX_PRIORITY);
    t.start();
    System.out.println(t.getPriority());
  }
}