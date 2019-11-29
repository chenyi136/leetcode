public class MinimumSizeSubarraySum {
    public static int minSubArrayLen(int s, int[] nums) {
        if(nums==null||nums.length==0) return 0;
        int sum=0,bac=0;
        int min=Integer.MAX_VALUE;
//         while(sum<s){
//             sum+=nums[i++];
//         }
        for(int i=0;i<nums.length;i++){
            sum+=nums[i];
            while(sum>=s){
                min=Math.min(min,i-bac+1);
                sum-=nums[bac];
                bac++;
            }
        }
        return min==Integer.MAX_VALUE?0:min;

    }

    public static void main(String[] args) {
        System.out.println(minSubArrayLen(3,new int[]{1,1}));
    }

}
