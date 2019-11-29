public class dp2 {
    public int minPathSum(int[][] grid) {
        int m=grid.length,n=grid[0].length;
        int[][] dp=new int[m][n];
        dp[0][0]=grid[0][0];
        for(int i=1;i<m;i++){
            dp[i][0]=dp[i-1][0]+grid[i][0];
        }
        for(int j=1;j<n;j++){
            dp[0][j]=dp[0][j-1]+grid[0][j];
        }
        for(int a=1;a<m;a++) {
            for (int b = 1; b < n; b++) {
                dp[a][b] = Math.min(dp[a - 1][b], dp[a][b - 1]) + grid[a][b];

            }
        }
        return dp[m-1][n-1];
    }
}
