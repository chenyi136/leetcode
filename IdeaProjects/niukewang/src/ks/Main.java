package ks;

import java.util.Arrays;
import java.util.Scanner;

/**
 * @ClassNameMain
 * @Author jianwen
 * @Date 19-9-16 下午9:25
 * @Version V1.0
 */
public class Main {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] nums = new int[n];
        for (int i = 0; i < n; i++) {
            nums[i] = sc.nextInt();
        }
        System.out.println(findLength(nums));
    }

    public static int findLength(int[] nums) {
        if (nums == null) return 0;
        Arrays.sort(nums);
        int maxlen = nums[nums.length - 1] - nums[0];
        int ans = 1;
        if (maxlen == 0) {
            return nums.length;
        }

        int[][] dp = new int[nums.length][maxlen+1];
        for (int i = 0; i < dp.length; i++) {
            for (int j = 0; j < maxlen; j++) {
                dp[i][j] = 1;
            }
        }
        for (int i = 1; i < nums.length; i++) {
            for (int j = i - 1; j >= 0; j--) {
                    int diff = nums[i] - nums[j];
                    dp[i][diff] = dp[j][diff] + 1;
                    ans = Math.max(ans, dp[i][diff]);
                }
            }
            return ans;
        }


}
