import java.util.Set;
import java.util.HashSet;
import java.util.Iterator;


class SetTest {
  public static void main(String[] args) {
    Set<String> set = new HashSet<String>();

    set.add("a");
    set.add("b");
    set.add("c");
    set.add("d");

    Iterator<String> it = set.iterator();

    while (it.hasNext()) {
      System.out.println(it.next());
    }
  }
}