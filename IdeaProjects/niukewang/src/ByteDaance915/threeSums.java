package ByteDaance915;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

/**
 * @ClassNamethreeSums
 * @Author jianwen
 * @Date 19-9-17 下午3:26
 * @Version V1.0
 */
public class threeSums {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int[] nums=new int[n];
        for(int i=0;i<n;i++){
            nums[i]=sc.nextInt();
        }
        int k=sc.nextInt();

        ArrayList<ArrayList<Integer>> result=new ArrayList<>();
        int res=0;
        Arrays.sort(nums);


        for(int m=0;m<n;m++){
            int left=m+1;
            int right=n-1;
            while(left<right){
                int sum=nums[left]+nums[right]+nums[m];
                if(sum<k){
                    res++;
                    left++;
                }else{
                    right--;
                }
            }
        }
        System.out.println(res);
    }

}
