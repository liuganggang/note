public class PrintTest {
  public static void main(String[] args) {

    HpPrint a = new HpPrint();

    a.open();
    a.print("abc");
    a.close();

    CannonPrint b = new CannonPrint();

    b.open();
    b.print("123");
    b.close();
  }
}