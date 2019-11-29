package kuaishou;

import java.util.Scanner;

/**
 * @ClassNameMaxMoney
 * @Author jianwen
 * @Date 19-8-10 下午3:24
 * @Version V1.0
 */
public class MaxMoney {
    public static void main(String[] args) {
        Scanner input=new Scanner(System.in);
        int n=input.nextInt();
        int[] nums=new int[n];
        for(int i=0;i<n;i++){
            nums[i]=input.nextInt();
        }
        System.out.println(getMax(nums));
    }
    public static long getMax(int[] nums){
        int len=nums.length;
        if(nums==null||len==0) return 0;
        long result=0;

        int left=0,right=len-1;
        long leftSum=nums[left],rightSum=nums[right];
        while(right>left){
            if(leftSum==rightSum) {
                result=leftSum;
                leftSum += nums[++left];
                rightSum += nums[--right];
            }

            if (leftSum < rightSum) {
                    leftSum += nums[++left];
                } else {
                    rightSum += nums[--right];
            }
        }
        return result;
    }
}
