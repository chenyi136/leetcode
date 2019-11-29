public class ProducrOfArray {
    public int[] productExceptSelf(int[] nums) {
        int[] result=new int[nums.length];
        if(nums==null||nums.length==0) return result;
        // int[] product=new int[nums.length];
        result[0]=1;
        for(int i=0;i<nums.length-1;i++){
            result[i+1]=result[i]*nums[i];
        }
        int temp=1;
        for(int j=nums.length-1;j>=0;j++){
            result[j]*=temp;
            temp=nums[j];
        }

        return result;

    }
}
