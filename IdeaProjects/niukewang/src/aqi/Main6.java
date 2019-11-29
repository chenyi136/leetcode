package aqi;

import java.util.Scanner;

/**
 * @ClassNameMain6
 * @Author jianwen
 * @Date 19-9-19 下午7:36
 * @Version V1.0
 */
public class Main6 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n=sc.nextInt();
        int m=sc.nextInt();
        int[] nums=new int[n];
        for(int i=0;i<n;i++){
            nums[i]=sc.nextInt();
        }
        int[] sum=new int[n];
        sum[0]=0;
        for(int i=1;i<n;i++){
            sum[i]=sum[i-1]+nums[i];
        }

        int[][] dp=new int[n][n];
        int i,j,l,k;
        int res=Integer.MAX_VALUE;
        for(l = m; l < n; ++l)
        {
            for(i = 1; i < n - l + 1; ++i)
            {
                j = i + l - 1;
                if(j > n)
                    break;
                dp[i][j] = Integer.MAX_VALUE;
                for(k = i; k < j; ++k)
                {
                    dp[i][j] = Math.min(dp[i][j],dp[i][k] + dp[k + 1][j] + sum[j] - sum[i-1]);
                    res=Math.min(dp[i][j],res);
                }
            }
        }


        System.out.println(res);

    }
}
