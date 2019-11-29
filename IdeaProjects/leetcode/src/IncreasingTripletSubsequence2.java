public class IncreasingTripletSubsequence2 {
    public static boolean increasingTriplet(int[] nums) {
        int small = Integer.MAX_VALUE;
        int bigger = Integer.MAX_VALUE;
        for (int i = 0; i <nums.length;i++){
            if(nums[i]<small) small=nums[i];
            else if(nums[i]<bigger) bigger=nums[i];
            else return true;

        }
        return false;
    }

    public static void main(String[] args) {
        int[] a=new int[]{2,4,-2,-3};
        System.out.println(increasingTriplet(a));
    }
}
