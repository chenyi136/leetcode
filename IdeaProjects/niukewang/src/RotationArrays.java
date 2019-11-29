public class RotationArrays {
    public int minNumberInRotateArray(int [] array) {
        int low = 0 ; int high = array.length - 1;
        while(low < high){
            int mid = low + (high - low) / 2;
            if(array[mid] > array[high]){
                low = mid + 1;
            }else if(array[mid] == array[high]){
                high = high - 1;
            }else{
                high = mid;
            }
        }
        return array[low];
    }

//    public static  int findSmallNumber(int[] nums) {
//        int left = 0;
//        int right = nums.length - 1;
//        if (nums[left] <= nums[right]) return nums[left];
//        while (left < right) {
//            int mid = left + (right - left) >> 1;
//            if (nums[left] == nums[mid] && nums[mid] == nums[right])
//                return min(nums);
//            if (nums[mid] >= nums[left]) {
//                left = left + 1;
//            }
//            if (nums[mid] < nums[left]) {
//                right = right - 1;
//            }
//        }
//        return nums[left];
//
//    }
//
//    public static int min(int [] nums){
//        int m=nums[0];
//        for(int i=1;i<nums.length-1;i++){
//            if(i<m) m=i;
//        }
//        return m;
//    }

}
