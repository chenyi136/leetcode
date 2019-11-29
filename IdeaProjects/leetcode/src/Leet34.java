/**
 * @ClassNameLeet34
 * @Author jianwen
 * @Date 19-8-18 下午11:00
 * @Version V1.0
 */
public class Leet34 {
    public static void main(String[] args) {
        int[] nums=new int[]{1};
        for(int i:searchRange(nums,1)){
            System.out.println(i);
        }
    }

    public static int[] searchRange(int[] nums, int target) {
        if(nums==null||nums.length==0) return new int[]{-1,-1};
        int left=0,right=nums.length-1,mid=0;

        while(left<=right){
            mid=left+(right-left)>>1;
            if(nums[mid]==target){
                int l=mid,r=mid;
                while((l-1)>=0&&nums[l-1]==target) l--;
                while((r+1)<=nums.length-1&&nums[r+1]==target)r++;
                return new int[]{l,r};
            }else if(nums[mid]<target){
                left=mid+1;
            }else{
                right=mid-1;
            }

        }
        return new int[]{-1,-1};
    }

}
