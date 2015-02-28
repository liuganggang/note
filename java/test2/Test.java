class Test {
  public static void main(String[] args) {
    int arr [] = {1,2,3,4};
    System.out.println(arr[1]);
    int arr2 [] = new int[10];
    arr2[1] = 5;
    System.out.println(arr2[1]);
    for (int i = 0; i < arr.length; i++) {
      System.out.println(arr[i]);
    }
    System.out.println("next");

    int arr3 [] [] = {{1,2,3}, {4,5,6,7}};
    for (int i = 0; i < arr3.length; i++) {
      for (int j = 0; j < arr3[i].length; j++) {
        System.out.println(arr3[i][j]);
      }
    }
  }
}