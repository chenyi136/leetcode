import java.util.Scanner;

/**
 * @ClassNameMain4
 * @Author jianwen
 * @Date 19-9-27 下午9:24
 * @Version V1.0
 */
public class Main4 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int contain=sc.nextInt();
        int[] weights=new int[n];
        int[] value=new int[n];
        for(int i=0;i<n;i++){
            weights[i]=sc.nextInt();
        }
        for(int i=0;i<n;i++){
            value[i]=sc.nextInt();
        }
        System.out.println(getValue(weights,value,contain));
    }

    public static int getValue(int[] weights,int[] values,int contain){
        int res=0;
        int n=weights.length;
        int[] dp=new int[contain+1];
        for(int i=1;i<n+1;i++){
            for(int j=contain;j>=weights[i-1];j--){
                dp[j]=Math.max(dp[j-weights[i-1]]+values[i-1],dp[j]);
            }
        }
        return  dp[contain];
    }

}
