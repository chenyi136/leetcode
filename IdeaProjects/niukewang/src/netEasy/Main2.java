package netEasy;

import java.util.Scanner;

/**
 * @ClassNameMain2
 * @Author jianwen
 * @Date 19-9-21 下午4:03
 * @Version V1.0
 */
public class Main2 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);


        int t=sc.nextInt();
        for(int i=0;i<t;i++){
            long  a=sc.nextInt();
            long b=sc.nextInt();
            int p=sc.nextInt();
            int q=sc.nextInt();
            int count=0;
            while(a<b){
                if((b-a)<p){
                    a=a+p;
                    count++;
                }
                else {
                    p=p*q;
                    count++;
                }
            }
            System.out.println(count);
        }
    }
}

