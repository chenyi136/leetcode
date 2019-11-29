import java.util.Stack;

public class Pattern132_2 {
    public boolean find132pattern(int[] nums) {
        if(nums==null||nums.length==0) return false;
        int third=Integer.MIN_VALUE;
        Stack<Integer> stack=new Stack<Integer>();
        for(int i=nums.length-1;i>=0;i--){
            if(nums[i]<third) return true;
            if(!stack.empty()&&nums[i]>stack.peek()){
                third=stack.pop();
            }
            stack.push(nums[i]);


        }
        return  false;


    }
}
