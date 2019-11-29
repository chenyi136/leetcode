import java.util.ArrayList;
import java.util.Stack;

public class IsPopOrder {
    public boolean isPopOrder(int [] pushA,int [] popA) {

        Stack<Integer> st=new Stack<Integer>();

        int j=0;
       for(int item:pushA){
           st.push(item);
           while(!st.isEmpty()&&st.peek()==popA[j]){
               st.pop();
               j++;
           }
       }
       if(st.isEmpty()) return true;
       else return false;

    }
}
