package ks;
import java.util.Scanner;


public class Main5 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String s = sc.nextLine();
        String[] str = s.split(",");
        int a = Integer.valueOf(str[0]);
        int b = Integer.valueOf(str[1]);
        int count = 0;
        if(b == 0){
            System.out.println(Math.abs(a-b));
            return;
        }
        if(a == 0 ){
            count++;
            a =1;
            if(b<0){
                b = -b;
            }
        }
        if(a >0 && b<0){
            System.out.println(Math.abs(a-b));
            return;
        }
        if(a<0 && b<0){
            a = -a;
            b =-b;
        }
        if(a<0 && b>0){
            count -= a;
            count ++;
            a =1;
        }
        while(a*2 <b){
            count++;
            a *=2;
        }
        count += Math.min(Math.min(b-a,2*a-b+1),a-b/2+1);
        System.out.println(count);}
}