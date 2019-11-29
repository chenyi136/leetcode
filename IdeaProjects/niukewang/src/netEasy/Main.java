package netEasy;

import java.util.Scanner;

/**
 * @ClassNameMain
 * @Author jianwen
 * @Date 19-9-21 下午3:42
 * @Version V1.0
 */
public class Main {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int t=sc.nextInt();
        for(int i=0;i<t;i++){
            int x=sc.nextInt();
            if(x<10) {
                System.out.println(x);
            } else{
                int m=x/9;
                int n=x%9;
                StringBuilder sb=new StringBuilder();
                if(n!=0){
                sb.append(n);}
                for(int j=0;j<m;j++){
                    sb.append(9);
                }
                System.out.println(sb.toString());
            }
        }

    }
}
