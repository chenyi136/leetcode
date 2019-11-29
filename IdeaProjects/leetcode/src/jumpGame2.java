/**
 * @ClassNamejumpGame2
 * @Author jianwen
 * @Date 19-10-1 上午12:37
 * @Version V1.0
 */
public class jumpGame2 {
    public static int jump(int[] nums){
        if(nums==null||nums.length==0) return 0;
        return minJump(nums);
    }
    public static int minJump(int[] nums){
        int jump=0;
        int start=0;
        // 当前所能达到的最大距离
        int curEnd=0;
        // 跳下一步所能到达的最大距离
        int nextEnd=curEnd;
        while(nextEnd<nums.length-1){
            for(int i=start;i<=curEnd;i++){
                nextEnd=i+nums[i]>nextEnd?i+nums[i]:nextEnd;
            }
            start=curEnd+1;
            curEnd=nextEnd;
            jump++;
        }
        return jump;
    }
}
