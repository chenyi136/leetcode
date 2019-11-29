import java.util.Scanner;
import java.util.Stack;

/**
 * @ClassNameRemoveDuplicatedLetters
 * @Author jianwen
 * @Date 19-9-12 上午10:54
 * @Version V1.0
 */
public class RemoveDuplicatedLetters {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);

            System.out.println(removeDuplicateLetters(sc.nextLine()));

    }

    public static String removeDuplicateLetters(String s) {
        if (s == null) return null;
        Stack<Character> st = new Stack<Character>();
        StringBuilder sb = new StringBuilder();

        char[] chars = s.toCharArray();
        int[] counts = new int[26];
        boolean[] used=new boolean[26];

        for (char ch : chars) {
            counts[ch - 'a']++;
        }
        st.push(chars[0]);
        for(char c:chars){
            counts[c-'a']--;
            if(st.contains(c)) continue;
            while(!st.isEmpty()&&st.peek()>c&&counts[st.peek()-'a']>0){
                st.pop();
            }
            st.push(c);
        }
        while (!st.isEmpty()) {
            sb.append(st.pop());
        }
        return sb.reverse().toString();
    }
}
