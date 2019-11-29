package tx;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main1 {
    public static void main(String[] args) {
//        Scanner sc=new Scanner(System.in);
//        int m=sc.nextInt();
//        int n=sc.nextInt();
//        int[] nums=new int[n];
//        for(int i=0;i<n;i++){
//            int temp=sc.nextInt();
//            nums[i]=temp;
//        }
        int m=20;
        int[] nums={1,2,5,10};
        int result=helper(m,nums);
        System.out.println(result);

    }

    public static int helper(int m,int[] nums){
        int[] dp=new int[m+1];
        dp[0]=0;
        for(int i=1;i<=m;i++){
            int min=i/nums[0]+1;
            for(int j=0;j<nums.length;j++){
                if(nums[j]<=i){
                   int temp=dp[i-nums[j]]+1;
                   if(temp<min){
                       min=temp;
                   }
                }
            }
            dp[i]=min;
        }
        return dp[m];

    }




}
