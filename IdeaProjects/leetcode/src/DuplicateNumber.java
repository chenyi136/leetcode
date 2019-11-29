/**
 * @ClassNameDuplicateNumber
 * @Author jianwen
 * @Date 19-9-12 下午12:23
 * @Version V1.0
 */
public class DuplicateNumber {
    public static void main(String[] args) {
        int[] a={1,3,4,2,2};
        System.out.println(findDuplicate(a));
    }
    public static int findDuplicate(int[] nums) {
        if(nums==null||nums.length==0){
            return -1;
        }
        for(int i=0;i<nums.length;i++){
            while(nums[i]!=i+1){
                if(nums[i]==nums[nums[i]-1]){
                    return nums[i];
                }
                int temp=nums[nums[i]-1];
                nums[nums[i]-1]=nums[i];
                nums[i]=temp;
            }
        }
        return -1;
    }
}
