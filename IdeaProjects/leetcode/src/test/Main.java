package test;

import javafx.scene.transform.Scale;

import java.text.DecimalFormat;
import java.util.Scanner;

/**
 * @ClassNameMain
 * @Author jianwen
 * @Date 19-9-26 下午7:33
 * @Version V1.0
 */
public class Main {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int m=sc.nextInt();
        int[] nums=new int[n];
        for(int i=0;i<n;i++){
            nums[i]=sc.nextInt();
        }

        DecimalFormat df = new DecimalFormat("0.000");
        double d1 = findMaxAverage(nums,m);
        System.out.println(df.format(d1));

    }
    public static  double findMaxAverage(int[] nums, int k) {
        double sum = 0;
        double res = Long.MIN_VALUE;
        for (int i = 0; i < nums.length; i++) {
            sum += nums[i];
            if (i >= k) {
                sum -= nums[i - k];
            }
            if (i >= k - 1) {
                res = Math.max(res, sum / k);
            }
        }
        return res;

    }
}
