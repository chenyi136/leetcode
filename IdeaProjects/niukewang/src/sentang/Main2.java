package sentang;

import java.util.Scanner;

/**
 * @ClassNameMain2
 * @Author jianwen
 * @Date 19-9-21 下午7:34
 * @Version V1.0
 */
public class Main2 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int[] nums=new int[n];
        for(int i=0;i<n;i++){
            nums[i]=sc.nextInt();
        }
        int max=Integer.MIN_VALUE;
        for(int i=0;i<n;i++){

            int[] dp=new int[n];
            int cur=nums[i];
            int t=nums[i];
            for(int j=1;j<n;j++){
                 cur=Math.max(nums[(i+j)%n],cur+nums[(i+j)%n]);
                 t=Math.max(t,cur);
            }
            max=Math.max(max,t);
        }
        System.out.println(max);
    }
}
