import java.util.Scanner;

/**
 * @ClassNameFindGreatestSumOfSubArray
 * @Author jianwen
 * @Date 19-8-22 上午11:37
 * @Version V1.0
 */
public class FindGreatestSumOfSubArray {
    public static int[] findIndex(int[] nums){
        int start=0,end=0;
        int greatSum=0,curSum=0;
        int p=0;
        for(int i=0;i<nums.length;i++){
            if(curSum<0){
                curSum=nums[i];
                p=i;
            }else{
                curSum+=nums[i];
            }
            if(curSum>greatSum){
                greatSum=curSum;
                start=p;
                end=i;
            }
        }
        return new int[]{start,end};
    }

    public static void main(String[] args) {
       int[] nums=new int[]{1,-2,3,10,-4,7,2,-19,2};
       for(int item:findIndex(nums)){
           System.out.println(item);
       }

    }

}
