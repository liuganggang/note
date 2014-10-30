public class LianXi1 {

  int class_num = 21;

  public static void main(String[] args) {
    int a = 1;
    int b = 2;
    int c = a++;
    int array [] = new int [3];
    // for (int i = a; i < 3; i++) {
    //   array[i] = i + 1;
    // }
    array [0] = 10;
    array [1] = 20;
    array [2] = 30;
    char array2 [] = {'l','i','u','g','a','n','g'};
    System.out.println("zidongdideng: " + (++a));
    System.out.println(c);
    System.out.println(array[0]);
    System.out.println(array2);

    LianXi1 mynum = new LianXi1();
    System.out.println("my new class num = " + mynum.class_num);
  }

}