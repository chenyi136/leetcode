package ByteDance2;

import java.util.Scanner;

/**
 * @ClassNameMain3
 * @Author jianwen
 * @Date 19-9-29 下午8:48
 * @Version V1.0
 */
import java.util.*;
public class Main3{
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while(sc.hasNext()){
            String s = sc.nextLine();
            String[] str = s.split(" ");
            int m  = Integer.valueOf(str[0]);
            int n = Integer.valueOf(str[1]);
            print(m-1,0,0,n-1,n);
            System.out.println();
        }
    }
    public static void print(int r1,int c1,int r2, int c2,int n ){
        if(r1 < r2 || c2<c1)
            return;
        if(r1 == r2){
            for (int i = c2; i >=c1 ; i--) {
                System.out.print(n*r1 + i+1 + " ");
            }
        }else if(c1 == c2){
            for (int i = r2; i <=r1 ; i++) {
                System.out.print(n*i + c1+1 + " ");
            }
        }else{
            for (int i = c2; i >=c1 ; i--) {
                System.out.print(n*r2 + i+1 + " ");
            }
            for (int i = r2+1; i <r1 ; i++) {
                System.out.print(n*i + c1+1 + " ");
            }
            for (int i = c1; i <=c2 ; i++) {
                System.out.print(n*r1 + i+1 + " ");
            }
            for (int i = r1-1; i >r2 ; i--) {
                System.out.print(n*i + c2+1 + " ");
            }
            print(r1-1,c1+1,r2+1,c2-1,n);
        }

    }
}