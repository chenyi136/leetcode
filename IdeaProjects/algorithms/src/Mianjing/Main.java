package Mianjing;

import java.util.Scanner;

/**
 * @ClassNameMain
 * @Author jianwen
 * @Date 19-9-12 上午10:20
 * @Version V1.0
 */
public class Main {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        String s=sc.nextLine();
        char[] chars=s.toCharArray();
        String result="";
        int count=1;
        for(int i=1;i<chars.length;i++){

            if(chars[i]==chars[i-1]){
                count++;
            }else{
                if(count==1)
                    result+=String.valueOf(chars[i-1]);
                else  result+=(count+String.valueOf(chars[i-1]));
                count=1;
            }
            if(i==chars.length-1){
                if(count==1)
                    result+=String.valueOf(chars[i]);
                else  result+=(count+String.valueOf(chars[i-1]));

            }
        }
        System.out.println(result);
    }


}
