import java.sql.SQLOutput;

public class MaxMumProductSubarray {
    public static int maxProduct(int[] nums) {
        int res=nums[0],n=nums.length;
        int[] f=new int[n];
        int[] g=new int[n];
        f[0]=nums[0];
        g[0]=nums[0];
        for(int i=1;i<n;i++){
            f[i]=Math.max(Math.max(f[i-1]*nums[i],g[i-1]*nums[i]),nums[i]);
            g[i]=Math.min(Math.min(f[i-1]*nums[i],g[i-1]*nums[i]),nums[i]);
            res=Math.max(res,f[i]);
        }
        return res;
    }

    public static void main(String[] args) {
        System.out.println(maxProduct(new int[]{2,3,-2,4}));
    }
}
