package ks;

import java.util.Scanner;

public class Main3 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        String s=sc.nextLine();
        String[] st=s.split(",");
        int x=Integer.valueOf(st[0]);
        int y=Integer.valueOf(st[1]);
//        int x=3,y=5;

        System.out.println(helper(x,y));

    }
    static int  helper(int x,int y){
        int count=0;
        int cur=x;
        while(cur!=y) {
            while(cur!=y&&cur*y<=0){
                if(cur<y){
                    cur++;
                    count++;
                }else{
                    cur--;
                    count++;
                }
            }
            while(cur!=y&&cur>0){
                if(cur<y) {
                    while (cur < y && cur * 2 < y) {
                        cur = cur * 2;
                        count++;
                    }

                    count += y - cur;
                    cur = y;
                }else{

                    count+=y-cur;
                    cur=y;
                }

            }
            while(cur!=y&&cur<0){
                if(cur<y) {


                    count += y - cur;
                    cur = y;
                }else{
                    while (cur >y && cur * 2 > y) {
                        cur = cur * 2;
                        count++;
                    }

                    count += cur-y;
                    cur = y;
                }
            }

        }
        return count;
    }
}
