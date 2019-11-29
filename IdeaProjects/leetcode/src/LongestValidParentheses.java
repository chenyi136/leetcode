import java.util.Stack;

/**
 * @ClassNameLongestValidParentheses
 * @Author jianwen
 * @Date 19-9-15 下午1:41
 * @Version V1.0
 */
public class LongestValidParentheses {
    public int longestValidParentheses(String s){
        if(s.length()<=1) return 0;
        int res=0,start=0;
        char[] chars=s.toCharArray();
        Stack<Integer> st=new Stack<>();
        for(int i=0;i<chars.length;i++){
            if(chars[i]=='('){
                st.push(i);
            }else {
                if(!st.isEmpty()){
                    st.pop();
                    res=st.isEmpty()?Math.max(i-start+1,res):Math.max(res,i-st.peek());

                }
            }
        }
        return res;

    }
}
