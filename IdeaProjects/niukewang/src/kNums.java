import java.util.ArrayList;
import java.util.Arrays;

public class kNums {
    public static void main(String[] args) {
        int[] input={4,5,1,6,2,7,3,8};
        System.out.println(GetLeastNumbers_Solution(input,8));

    }
    public static ArrayList<Integer> GetLeastNumbers_Solution(int [] input, int k) {
        if(input==null||input.length==0||k<0||k>input.length) return null;
        ArrayList<Integer> list=new ArrayList<Integer>();
        int n=input.length;
        int start=0,end=n-1;
        int index=partition(input,start,end);
        while(index!=k-1){
            if(index>k-1) {
                end=index-1;
                index=partition(input,start,end);
            }else{
                start=index+1;
                index=partition(input,start,end);
            }
        }

        for(int i=0;i<=index;i++){
            list.add(input[i]);
        }

        return list;

    }
    public static int partition(int[] input,int start,int end){
        int last=input[end];
        int p=start-1;
        int q=start;
        while(q<end){
            if(input[q]<=last){
                p=p+1;
                swap(input,p,q);
            }
            q++;
        }
        swap(input,p+1,end);
        return p+1;
    }

    public static void swap(int[] nums,int a,int b){
        int temp=nums[a];
        nums[a]=nums[b];
        nums[b]=temp;
    }
}
