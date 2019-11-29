package jd;

import java.util.Scanner;

/**
 * @ClassNameMain
 * @Author jianwen
 * @Date 19-8-24 下午7:40
 * @Version V1.0
 */
public class Main {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int[] nums=new int[n];
        for(int i=0;i<n;i++){
            nums[i]=sc.nextInt();
        }
        System.out.println(counts(nums,0,nums.length));


    }
     public static int maxIndex(int[] nums){
        int maxIndex=0,max=nums[0];
        for(int i=1;i<nums.length;i++){
            if(nums[i]>max){
                max=nums[i];
                maxIndex=i;
            }
        }
        return maxIndex;

     }

     public static int counts(int[] nums,int begin,int end){
        if(begin==end) return 1;
        return counts(nums,begin,maxIndex(nums)-1)*counts(nums,maxIndex(nums)+1,end);
     }



}
