package redbook;

import java.util.Scanner;

/**
 * @ClassNameMain3
 * @Author jianwen
 * @Date 19-9-14 下午3:50
 * @Version V1.0
 */
public class Main3 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int[] nums=new int[n];

        for(int i=0;i<n;i++){
            nums[i]=sc.nextInt();
        }

        int[] dp=new int[n+1];
        int[] count=new int[n+1];
        dp[0]=0;dp[1]=nums[0];
        count[0]=0;count[1]=1;
        int maxDp=0,maxCount=0;
        for(int i=2;i<=n;i++){
            if(dp[i-1]>dp[i-2]+nums[i-1]){
                count[i]=count[i-1];
                dp[i]=dp[i-1];
            }else {
                if(dp[i-1]==(dp[i-2]+nums[i-1])){
                    count[i]=Math.min(count[i-1],count[i-2]+1);
                    dp[i]=dp[i-1];
                }else{
                    count[i]=count[i-2]+1;
                    dp[i]=dp[i-2]+nums[i-1];
                }
            }
            if(maxDp<dp[i]){
                maxDp=dp[i];
                maxCount=count[i];
            }else{
                if(maxCount==dp[i]){
                    maxCount=Math.min(maxCount,count[i]);
                }
            }


        }
        System.out.println(maxDp+" "+maxCount);

    }

}
