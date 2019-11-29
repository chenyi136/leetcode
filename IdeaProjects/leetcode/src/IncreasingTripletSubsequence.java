public class IncreasingTripletSubsequence {
    public boolean increasingTriplet(int[] nums) {
        if(nums==null||nums.length==0) return false;
        int n=nums.length;
        int max=1;
        int[] dp=new int[n];
        for(int i=0;i<n;i++) dp[i]=1;
        for(int i=1;i<n;i++){
            for(int j=0;j<=i;j++){
                if(nums[j]<nums[i]&&dp[j]+1>dp[i])
                    dp[i]=dp[j]+1;
            }
            if(dp[i]>max) max=dp[i];
        }
        return max>=3?true:false;
    }
}