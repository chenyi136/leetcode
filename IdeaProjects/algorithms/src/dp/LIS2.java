package dp;

public class LIS2 {
    public static int lengthOfLIS(int[] nums){
        int[] tails=new int[nums.length];
        int size=0;
        for(int x:nums){
            int i=0,j=size;
            while(i!=j){
                int m=i+(j-i)>>1;
                if(tails[m]<x)
                    i=m+1;
                else
                    j=m;
            }
            tails[i]=x;
            if(i==size) ++size;
        }
        return size;

    }
}
