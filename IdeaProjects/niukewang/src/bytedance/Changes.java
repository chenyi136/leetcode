package bytedance;

import java.util.Scanner;

/**
 * @ClassNameChanges
 * @Author jianwen
 * @Date 19-9-14 下午9:50
 * @Version V1.0
 */
public class Changes {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int N=sc.nextInt();
        int C=1024-N;
        int[] coins={1,4,16,64};
        System.out.println(minChanges(coins,C));

    }

    static int minChanges(int[] coins,int C){
        int[] dp=new int[C+1];
        dp[0]=0;dp[1]=1;
        for(int i=2;i<=C;i++){
            dp[i]=i;
            for(int j=0;j<coins.length;j++){
                if(i>=coins[j]){
                    dp[i]=Math.min(dp[i],dp[i-coins[j]]+1);
                }
            }
        }
        return dp[C];
    }
}
