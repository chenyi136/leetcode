public class JumpGame {
    public boolean jump(int[] nums){
        if(nums==null||nums.length==0)
            return false;
        int max=nums[0];
        for(int i=1;i<nums.length;i++){
            if(max>=nums.length-1) return true;
            max=Math.max(max,i+nums[i]);

        }
        return false;

    }
}
