import java.util.Stack;

/**
 * @ClassNameremoveKdigits
 * @Author jianwen
 * @Date 19-9-14 下午11:45
 * @Version V1.0
 */
public class removeKdigits {
    public String remove(String num,int k){
        Stack<Character> st=new Stack<>();
        char[] chars=num.toCharArray();

        for(char ch:chars){
            while(!st.isEmpty()&&st.peek()>ch&&k>0){
                st.pop();
                k--;
            }
            st.push(ch);
        }
        while(k>0&&!st.isEmpty()){
            st.pop();
            k--;
        }
        StringBuilder sb=new StringBuilder();
        while (!st.isEmpty()){
            sb.append(st.pop());
        }


        String result= sb.reverse().toString();
        while(result.length()>0&&result.charAt(0)=='0'){
            result=result.substring(1);
        }
        return result.length()==0?"0":result;
    }

}
