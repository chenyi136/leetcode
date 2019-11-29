package ks;

import java.util.Arrays;
import java.util.Scanner;

/**
 * @ClassNameMain7
 * @Author jianwen
 * @Date 19-9-16 下午9:50
 * @Version V1.0
 */
public class Main7 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int[] nums=new int[n];
        for(int i=0;i<n;i++){
            nums[i]=sc.nextInt();
        }
        System.out.println(minValue(nums));
    }
    public static int minValue(int[] nums){
        int sum=Arrays.stream(nums).sum();
        int len=nums.length;
        int halfSum=sum/2;

        int m=len+1,n=halfSum+1;
        int[][] dp=new int[m][n];
        for(int i=0;i<dp[0].length;i++){
            dp[0][i]=0;
        }
        for(int i=0;i<dp.length;i++){
            dp[i][0]=0;
        }
        for(int i=1;i<m;i++){
            for(int j=1;j<n;j++){
                dp[i][j]=dp[i-1][j];
                if(j-nums[i-1]>=0&&dp[i-1][j-nums[i-1]]+nums[i-1]>dp[i][j]){
                    dp[i][j]=dp[i-1][j-nums[i-1]+nums[i-1]];
                }
            }
        }
        return dp[len][halfSum];
    }
}
