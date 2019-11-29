package zhenti;

import java.util.Scanner;

public class Main {
    public static void main(String[] args){
        Scanner sc=new Scanner(System.in);
        int t=sc.nextInt();
        for(int i=0;i<t;i++){
            int n=sc.nextInt();
            int k=sc.nextInt();
            int d1=sc.nextInt();
            int d2=sc.nextInt();

            if((d1+d2)==(n-k)) System.out.println("yes");
            else System.out.println("no");

        }
    }
}
