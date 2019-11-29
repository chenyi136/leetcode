package Baidu;

import java.math.BigInteger;
import java.util.Scanner;

/**
 * @ClassNameMain4
 * @Author jianwen
 * @Date 19-9-19 下午5:38
 * @Version V1.0
 */
public class Main4 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        long num = sc.nextLong();
        long ans = 1;
        while(num > 0){
            ans = ans*num;
            if (ans>100000003)
            ans = ans % 100000003;
            num--;
        }


        System.out.println(ans);

    }
}
