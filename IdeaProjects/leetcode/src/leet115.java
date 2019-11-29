

public class leet115 {

    public static void main(String[] args){
        System.out.println(numDistinct("rabbbit","rabbit"));
    }
    public static int numDistinct(String s, String t){
        int m=s.length(),n=t.length();
        int[][] dp=new int[n+1][m+1];
        for(int i=0;i<=m;i++){
            dp[0][i]=1;
        }
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s.charAt(j-1) == t.charAt(i-1)) {
                    dp[i][j] = dp[j-1][i] + dp[j-1][i-1];
                } else {
                    dp[i][j] = dp[j-1][i];
                }
            }
        }
        return dp[n][m];

    }
}
