package ByteDaance915;

import java.util.ArrayList;
import java.util.Scanner;

/**
 * @ClassNameMain3
 * @Author jianwen
 * @Date 19-9-15 下午4:55
 * @Version V1.0
 */
public class Main3 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int[] nums=new int[n];
        for(int i=0;i<n;i++){
            nums[i]=sc.nextInt();
        }
        System.out.println(maxSc(nums));


    }
    public static int maxSc(int[] nums){
        int n=nums.length;
        int[][]dp=new int[n][n];
        for(int i=0;i<n;i++){
            dp[i][i]=nums[i];
        }
        int[] sum=new int[n];
        sum[0]=nums[0];
        for(int i=0;i<n-1;i++){
            sum[i+1]=sum[i]+nums[i+1];
        }
        for(int i=1;i<n;i++){
            for(int j=0;i+j<n;j++){
                dp[j][i+j]=Math.max(sum[i+j]-sum[j]+nums[i]-dp[j+1][i+j],sum[i+j]-sum[j]+nums[j]-dp[j][i+j-1]);
            }
        }
        return dp[0][n-1];
    }
}
