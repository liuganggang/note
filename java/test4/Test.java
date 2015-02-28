import java.util.List;
import java.util.ArrayList;

class Test {
  public static void main(String[] args) {
    ArrayList<String> arr = new ArrayList<String>();
    arr.add("a");
    arr.add("b");
    arr.add("c");
    arr.add("d");
    arr.remove(3);

    for (int i = 0; i < arr.size(); i++) {
      System.out.println(arr.get(i));
    }
  }
}