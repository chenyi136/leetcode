import java.util.Stack;

public class EvaluateReversePolishNotation {
    public static int evalRPN(String[] tokens) {
        Stack<Integer> st=new Stack<Integer>();
        for(String s:tokens){
            if(s!="+"&&s!="-"&&s!="*"&&s!="/"){
                st.push(Integer.parseInt(s));
            }else{
                int num1=st.pop();
                int num2=st.pop();
                if(s=="+") st.push(num2+num1);
                if(s=="-") st.push(num2-num1);
                if(s=="*") st.push(num2*num1);
                if(s=="/") st.push(num2/num1);
            }
        }
        return st.pop();
    }

    public static void main(String[] args) {
        String[] tokens={"0","3","/"};
        System.out.println(evalRPN(tokens));
    }
}
