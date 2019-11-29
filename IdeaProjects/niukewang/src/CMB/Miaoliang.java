package CMB;

import java.util.ArrayList;
import java.util.Scanner;

/**
 * @ClassNameMiaoliang
 * @Author jianwen
 * @Date 19-9-14 上午12:12
 * @Version V1.0
 */
public class Miaoliang {

        public static void main(String[] args) {
            Scanner sc = new Scanner(System.in);
            String[] string = sc.nextLine().split(" ");
            int[] num = new int[string.length];
            for(int i = 0;i < num.length;i++) {
                num[i] = Integer.parseInt(string[i]);
            }


            int H = sc.nextInt();

            if(num.length > H) {
                System.out.println(0);
                return ;
            }
            int count = 1;
            while(!ss(num,count,H)) {
                count++;
            }
            System.out.println(count);
        }
        public static boolean ss(int[] num,int count,int H) {
            int sum = 0;
            for(int i = 0;i < num.length;i++) {
                sum += (num[i] - 1) / count + 1;
                if(sum > H)
                    return false;
            }
            return true;
        }


}
