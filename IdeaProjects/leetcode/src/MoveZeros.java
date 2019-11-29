public class MoveZeros {
    public void moveZeroes(int[] nums) {
        if(nums==null||nums.length==0) return;
        int index=0;
        for(int i:nums){
            if(i!=0) nums[index++]=i;
        }
        while(index!=nums.length){
            nums[index++]=0;
        }
        return;
    }
}
