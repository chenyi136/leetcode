import java.util.Scanner;

public class revertNums {
    public static void main(String[] args) {

            Scanner sc = new Scanner(System.in);
            while (sc.hasNext()) {
                long n = sc.nextInt(), m = sc.nextInt();
                System.out.println(n * m >> 1);
            }

    }

}
