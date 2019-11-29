public class leet42 {

    public static void main(String[] args){
        System.out.println( trap( new int[] {0,1,0,2,1,0,1,3,2,1,2,1} ) );
    }

    public static int trap(int[] height)
    {
        int res=0;
        int n=height.length;
        int i=0,j=n-1;
        while(i<j)
        {
            int mn = Math.min(height[i], height[j]);
            if (height[i] == mn) {
                ++i;
                while (i < j && height[i] < mn) {
                    res += mn - height[i++];
                }
            } else {
                --j;
                while (i < j && height[j] < mn) {
                    res += mn - height[j--];
                }

            }
        }
        return res;
    }
}
