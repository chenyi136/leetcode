package xiaomi;

import java.util.Scanner;

/**
 * @ClassNameZichan
 * @Author jianwen
 * @Date 19-9-14 上午12:47
 * @Version V1.0
 */
public class Zichan {
    public static void main(String[] args) {
        Scanner scanner=new Scanner(System.in);
        String[] inputs= scanner.nextLine().split(",");
        int container=Integer.parseInt(inputs[0]);
        String[] s1=inputs[2].split(" ");
        String[] s2=inputs[3].split(" ");
        int[] weights=new int[s1.length];
        for(int i=0;i<s1.length;i++){
            weights[i]=Integer.parseInt(s1[i]);
        }
        int[] values=new int[s2.length];
        for(int i=0;i<s2.length;i++){
            values[i]=Integer.parseInt(s2[i]);
        }
        System.out.println(maxValue(weights,values,container));

    }
    public static int maxValue(int[] weights,int[]values,int container){
        if(container<0) return 0;
        int[][] dp=new int[weights.length][container+1];
        for(int i=0;i<=container;i++){
            dp[0][i] = weights[0] <= i ? values[0] : 0;
        }
        //填充其他行和列
        for (int i = 1; i < weights.length; i++) {
            for (int j = 0; j <= container; j++) {
                dp[i][j] = dp[i - 1][j];
                if (weights[i] <= j) {
                    dp[i][j] = Math.max(dp[i][j], values[i] + dp[i - 1][j - weights[i]]);
                }
            }
        }
        return dp[weights.length - 1][container];

    }
}
