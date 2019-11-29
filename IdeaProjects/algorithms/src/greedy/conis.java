package greedy;

/**
 * @ClassNameconis
 * @Author jianwen
 * @Date 19-9-8 下午1:30
 * @Version V1.0
 */
public class conis {
    public static int coinsChange(int[] coins, int amount) {
        if(coins==null||coins.length==0) return -1;
        int[] dp=new int[amount+1];
        dp[0]=0;
        for(int i=1;i<=amount;i++){
            dp[i]=Integer.MAX_VALUE;
        }
        for(int temp:coins){
            for(int i=temp;i<=amount;i++){
                dp[i]=Math.min(dp[i],dp[i-temp]+1);

            }
        }
        return dp[amount]==Integer.MAX_VALUE?-1:dp[amount];
    }

    public static void main(String[] args) {
        int[]nums=new int[]{2};
        int result=coinsChange(nums,3);
        System.out.println(result);
    }
}
