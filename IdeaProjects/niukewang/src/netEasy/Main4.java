package netEasy;

import java.util.Scanner;

/**
 * @ClassNameMain4
 * @Author jianwen
 * @Date 19-9-21 下午4:28
 * @Version V1.0
 */
public class Main4 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int t=sc.nextInt();
        for(int i=0;i<t;i++){
            int n=sc.nextInt();
            int[] nums=new int[n];
            for(int j=0;j<n;j++){
                nums[j]=sc.nextInt();
            }
            System.out.println(lengthOfLIS(nums));

        }
    }


        public static int lengthOfLIS(int[] nums){
            if(nums==null||nums.length==0) return 0;
            boolean[] dp=new boolean[nums.length];
            dp[0]=true;

            for(int i=1;i<dp.length;i++){
                int temp=nums[i];
              for(int j=i-1;j>=0;j--){
                    if(nums[i]<nums[j]){
                        dp[i]=false;
                        break;
                    }else {


                        if (temp >= 2 * nums[j]) {
                            dp[i] = true;
                            break;
                        } else {
                            temp = temp - nums[j];
                        }
                    }
              }
              if(dp[i]==false) break;
            }
            int res=0;
            for(int i=dp.length-1;i>=0;i--){
                if(dp[i]==true){
                   res=i;
                   break;
                }
            }
            return res+1;

        }

}
