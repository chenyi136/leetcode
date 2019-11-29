package Baidu;

import java.util.Scanner;

/**
 * @ClassNameMain
 * @Author jianwen
 * @Date 19-9-19 下午4:37
 * @Version V1.0
 */
public class Main {
    static int[] a=new int[10007];
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int res=1;
        int cnt=0;
        for(int i=1;i<=n;i++) a[i]=i;
        for(int i=5;i<=n;i+=5)
        {
            while(a[i]%5==0)
            {
                a[i]/=5;
                cnt++;
            }
        }
        for(int i=2;i/2<=cnt;i+=2) a[i]/=2;
        for(int i=2;i<=n;i++)
        {
            res*=a[i];
            while(res%10==0) res/=10;
            res%=10;
        }
        System.out.println(res);
    }
}
