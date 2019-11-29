package duxiaoman;


import java.util.Scanner;

public class main1 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        long[] nums=new long[n];
        for(int i=0;i<n;i++){
            nums[i]=sc.nextLong();
        }
        for(int i=0;i<nums.length;i++){
            System.out.println(panduan(nums[i]));
        }
    }

    public static  String panduan(long num){


        long dnum=num;
        long factornum=0,count=0;
        while(dnum>0){
            long temp=dnum%10;
            factornum++;

            if(num%temp==0) count++;
            dnum/=10;
            if(dnum>0&&num%dnum==0) count++;

        }
        if(count==jiecheng(factornum)){
            return "G";
        }else if(count==0){
            return "S";
        }else  {
            return "H";
        }
    }

    static long jiecheng(long m){
        long result=1;
        for(long j=m;j>0;j--){
            result*=j;
        }
        return result;
    }

}
