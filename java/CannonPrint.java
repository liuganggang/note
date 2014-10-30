public class CannonPrint extends Print {

  void close() {
    this.clean();
    super.close();
  }

  void clean() {
    System.out.println("清理!");
  }
}