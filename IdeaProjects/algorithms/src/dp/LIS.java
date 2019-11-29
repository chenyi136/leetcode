package dp;

public class LIS {
    public static void main(String[] args) {
        int[] nums={1,3,4,7,2,5,9};
        System.out.println(lengthOfLIS(nums));
    }


    public static int lengthOfLIS(int[] nums){
        if(nums==null||nums.length==0) return 0;
        int[] dp=new int[nums.length];
        dp[0]=1;
        for(int i=1;i<dp.length;i++){
            dp[i]=1;
            for(int j=0;j<i;j++){
                if(nums[j]<nums[i]){
                    dp[i]=Math.max(dp[i],dp[j]+1);
                }
            }
        }

        return dp[dp.length-1];

    }
}
