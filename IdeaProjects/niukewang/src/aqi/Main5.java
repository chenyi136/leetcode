package aqi;

import java.util.Arrays;
import java.util.Scanner;

public class Main5 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        String input=sc.nextLine();
        int k=sc.nextInt();
        System.out.println(count(input,k));
    }

    public static String count(String s,int k){
        if(k>1){
           String ans=s;
           for(int i=0;i<s.length();i++){
               String T=s.substring(i)+s.substring(0,i);
               if(T.compareTo(ans)<0) ans=T;
           }
           return ans;
        }else {
            char[] ca= s.toCharArray();
            Arrays.sort(ca);
            return new String(ca);

        }
    }


}
