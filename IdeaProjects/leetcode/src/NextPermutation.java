public class NextPermutation {
    public static void main(String[] args) {
        int[] nums={1,1,5};

        for(int it:nextPer(nums)){
            System.out.println(it);
        }
    }
    public static int[] nextPer(int[] nums){
        if(nums==null||nums.length==0) return nums;
        int n=nums.length;
        int i;
        for( i=n-1;i>0;i--){
            if(nums[i]>nums[i-1]){
                int temp=n-1;
                while(nums[i-1]<nums[temp]){
                    temp--;
                }
                swap(nums,temp,i-1);
                break;
            }
        }
        if(i<n-1) {
            reverse(nums, i + 1, n - 1);
        }
        return  nums;

    }
    public static void  swap(int[] nums,int i,int j){
        int item=nums[i];
        nums[i]=nums[j];
        nums[j]=item;
    }

    public static void reverse(int[] nums,int start,int end){
        for(int i=0;i<=(end-start)/2;i++){
            int item=nums[start+i];
            nums[start+i]=nums[end-i];
            nums[end-i]=item;
        }
    }

}
