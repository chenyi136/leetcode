public class TargetSum494 {
    int result=0;

    public int findTargetSumWays(int[] nums,int target){
        if(nums==null||nums.length==0) return result;
        helper(nums,target,0);
        return result;

    }

    private void helper(int[] nums, int target, int index) {
        if (index == nums.length) {
            if (target == 0) result++;
            return;
        }
      helper(nums,target-nums[index],index+1);
      helper(nums,target+nums[index],index+1);
    }


}
