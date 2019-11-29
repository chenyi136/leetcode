package yuanfudao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Scanner;

/**
 * @ClassNameMain2
 * @Author jianwen
 * @Date 19-8-24 下午4:56
 * @Version V1.0
 */
public class Main2 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int T=sc.nextInt();
        for(int i=0;i<T;i++){
            int n=sc.nextInt();

            int[] nums=new int[n];
            for(int j=0;j<n;j++){
               nums[j]=sc.nextInt();
            }
            int result=0;
            int k=n-3;
            while(nums[k]!=0) {
                result+=nums[k];
                nums[k]=0;
                nums[k+1]-=nums[k];
                nums[k+2]-=nums[k];
                Arrays.sort(nums);
            }

            System.out.println(result);


        }
    }


}
