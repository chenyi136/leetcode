import java.util.Stack;

public class Main {

    public static void main(String[] args) {
        System.out.println(longestValidParentheses("()()))((()()()"));


    }

    public static int longestValidParentheses(String s) {
        Stack<Integer> st = new Stack<Integer>();
        char[] chars = s.toCharArray();
        int longest = 0, n = chars.length;
        for (int i = 0; i < n; i++) {
            if (chars[i] == '(') st.push(i);
            else {
                if (!st.isEmpty()) {
                    if (chars[st.peek()] == '(')
                        st.pop();
                    else st.push(i);
                } else st.push(i);
            }
        }
        if (st.isEmpty()) longest = s.length();
        else {
                int a = n, b = 0;
                while (!st.isEmpty()) {
                    b = st.peek();
                    st.pop();
                    longest = Math.max(longest, a - b - 1);
                    a = b;
                }
                longest = Math.max(longest, a);
        }

        return longest;
    }
}

