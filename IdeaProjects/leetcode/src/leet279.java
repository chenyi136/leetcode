public class leet279 {
    public int numSquares(int n) {
        if (n <= 0)
        {
            return 0;
        }

        int nums[]=new int[n+1];
        nums[0]=1;

        for(int i=1;i<n+1;i++){
            int q=100000;
            for(int j=1;j*j<i;j++){
                q=Math.min(q,1+nums[i-j*j]);
            }
            nums[i]=q;
        }
        return nums[n+1];

    }

}
