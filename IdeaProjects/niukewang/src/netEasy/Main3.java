package netEasy;

import java.util.Scanner;

/**
 * @ClassNameMain3
 * @Author jianwen
 * @Date 19-9-21 下午4:21
 * @Version V1.0
 */
public class Main3 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int res=0;
        int n=sc.nextInt();
        int[] nums=new int[n];
        for(int i=0;i<n;i++){
            nums[i]=sc.nextInt();
        }

        for(int i=0;i<nums.length-1;i++){
            for(int j=i+1;j<nums.length;j++){
                if(nums[j]<nums[i]){
                    res+=nums[i]-nums[j];
                }
            }
        }
        System.out.println(res);
    }
}
