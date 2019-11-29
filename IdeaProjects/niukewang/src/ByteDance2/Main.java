package ByteDance2;

import javafx.scene.transform.Scale;

import java.util.Scanner;

/**
 * @ClassNameMain
 * @Author jianwen
 * @Date 19-9-29 下午7:55
 * @Version V1.0
 */
public class Main {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        while(sc.hasNext()) {
            String[] s = sc.nextLine().split(" ");
            int a = Integer.valueOf(s[0]);
            int b = Integer.valueOf(s[1]);
            int c = Integer.valueOf(s[2]);

            int sum = a + b + c;
            if (sum == 0) {
                System.out.println("true");
                return;
            }
            if (sum % 2 == 1) {
                System.out.println("false");
            } else {
                System.out.println("true");
            }
        }


}
}
