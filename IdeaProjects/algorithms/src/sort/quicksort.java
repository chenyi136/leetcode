package sort;


import java.util.Random;

public class quicksort {

    public static void quickSort(int[] nums,int start,int end ){
        if(nums==null||nums.length==0||start<0||end>=nums.length) return;
        if(start<end){
            int dp=partition1(nums,start,end);
            quickSort(nums,start,dp-1);
            quickSort(nums,dp+1,end);
        }
    }

    public static int partition1(int[] nums,int start,int end){

//        Random random=new Random();
//
//        int index=random.nextInt(end)%(end-start+1)+start;
        int pivot=nums[start];
        while(start<end){

            while(start<end&&nums[end]>=pivot) end--;
            if(nums[end]<pivot) nums[start++]=nums[end];
            while(start<end&&nums[start]<=pivot) start++;
            if(nums[start]>pivot) nums[end--]=nums[start];
//              while(nums[end]>=pivot) end--;
//              nums[start++]=nums[end];
//              while(nums[start]<=pivot) start++;
//              nums[end--]=nums[start];
        }
        nums[start]=pivot;
        return start;

    }

    public static int partition2(int[] nums,int start,int end){
        int pivot=nums[end];
        int i=start-1,j=start;
        while(j<end){
            if(nums[j]<pivot){
                swap(nums,++i,j);
            }
            j++;
        }
        swap(nums,++i,j);
        return i;
    }

    public static void  swap(int[] nums,int i,int j){
        int temp=nums[i];
        nums[i]=nums[j];
        nums[j]=temp;
    }


    public static void main(String[] args) {
        int[] nums={7,3,6,8,12,4,5,15};
        quickSort(nums,0,nums.length-1);
        for(int i:nums) System.out.println(i);
    }
}
