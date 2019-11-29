package Mianjing;

import java.util.Scanner;

/**
 * @ClassNameCountsOfZeroN
 * @Author jianwen
 * @Date 19-10-10 下午10:09
 * @Version V1.0
 */
public class CountsOfZeroN {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int cnt=0;
        do{
            n/=5;
            cnt+=n;
        }while(n>0);
        System.out.println(cnt);

    }
}
