package Mianjing;

import java.util.Scanner;

public class HeapSort {
    /**
     *
     * @param nums
     * @param l 最大序号
     */
    public static void HeapInit(int[] nums,int l){
        for(int i=(l-1)/2;i>=0;i--){
            HeapAdjust(nums,i,l);
        }
    }

    private static void HeapAdjust(int[] nums, int s, int l) {
        int temp=nums[s];
        int i=s,j;
        for(j=2*i+1;j<=l;j=2*j+1){
            if(j<l&&nums[j]<nums[j+1]){
                j=j+1;
            }
            //如果调整节点大于其子节点最大的值则无需调整
            if(temp>nums[j]) {break;}
            nums[i]=nums[j];
            i=j;
        }
        nums[i]=temp;
    }

    private  static void heapSort(int[] nums,int l){
        for(int i=l;i>0;i--){
            int temp=nums[0];
            nums[0]=nums[i];
            nums[i]=temp;
            //因为每次调整都是对根节点进行调整所以下列方法s永远为0
            HeapAdjust(nums,0,i-1);
        }
    }

    public static void main(String[] args) {
//        Scanner sc=new Scanner(System.in);
//        int l=sc.nextInt();
//        int[] nums=new int [l];
//        for(int i=0;i<l;i++){
//            nums[i]=sc.nextInt();
//        }
        int[]  nums={2,4,3,9,8};
        int l=nums.length;
//        for(int i=(l-1)/2;i>=0;i--){
//            HeapAdjust(nums,i,4);
//        }
        HeapInit(nums,l-1);
        heapSort(nums,l-1);
        for(int n:nums){
            System.out.println(n);
        }
    }
}
