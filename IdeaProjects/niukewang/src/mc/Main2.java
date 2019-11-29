package mc;

import java.math.BigInteger;
import java.util.Scanner;

public class Main2 {
    public static void main(String[] args) {

        Scanner sc=new Scanner(System.in);
        String in=sc.nextLine();
        String[] nums=in.split(" ");

        StringBuilder result=new StringBuilder("0x");


        int[] inits={64,40,130};
        int[] lens=new int[3] ;
        for(int i=0;i<nums.length;i++){
            String temp=convert(nums[i]);
            lens[i]=temp.length();
        }

        for(int i=0;i<nums.length;i++){
            String temp=convert(nums[i]);
            result.append(temp);
            int zeros=inits[i]-lens[i];
            for(int j=0;j<zeros;j++){
                result.append(0);
            }

        }
        System.out.println(result.toString());

    }

    public static String convert(String num){
        String result;
        if(num.substring(0,2).equals("0x")){
             result=num.substring(2,num.length());
        }else{
           result=new BigInteger(num,10).toString(16);


        }
        return result;

    }
}
