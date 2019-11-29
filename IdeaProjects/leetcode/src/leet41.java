import java.util.Arrays;

public class leet41 {

    public static void  main(String[] args){
        System.out.println("aa" );
        System.out.println(firstMissingPositive(new int[]{7,8,9,11,12}));

    }
    public static int firstMissingPositive(int[] nums) {
        if(nums==null||nums.length==0){
            return 1;
        }
        for(int i=0;i<nums.length;i++){
            while(nums[i]>0&&nums[i]!=nums[nums[i]-1]&&nums[i]<=nums.length){
                swap(nums[i],nums[nums[i]-1]);
            }
        }
//        Arrays.sort(nums);
//        int i;
//        for(i=0;i<nums.length;i++){
//            if(nums[i]>0)
//                break;
//        }
//        if(nums[i]!=1) return 1;
//        else{
//            int j=i+1;
//            while(j<nums.length){
//                if(nums[j]!=nums[j-1]+1) break;
//                j++;
//            }
//          return nums[j-1]+1;
//        }
        for(int i=0;i<nums.length;i++){
            if(nums[i]!=i+1) return i+1;

        }
        return nums.length+1;


    }

    private static void swap(int num, int num1) {
        int temp=num;
        num=num1;
        num1=temp;
    }
}
