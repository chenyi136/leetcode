package tx;

import java.util.Scanner;

public class Main2 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();


       String s=sc.nextLine();
       char[] chars=s.toCharArray();

       int count0=0;
       int count1=0;

       for(char c:chars){
           if(c=='0') count0++;
           else count1++;
       }
        System.out.println(Math.abs(count0-count1));

    }
}
