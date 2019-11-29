package redbook;

import java.util.Scanner;
import java.util.Stack;

/**
 * @ClassNameMain2
 * @Author jianwen
 * @Date 19-9-14 下午3:42
 * @Version V1.0
 */
public class Main2 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        char[] chars=sc.nextLine().toCharArray();

        Stack<Character> st=new Stack<>();
        for(char ch:chars){
            if(ch=='<'){
                if(!st.isEmpty()&&(st.peek()!='('&&st.peek()!=')')){
                    st.pop();
                }

            }else{
                st.push(ch);
            }


        }
        StringBuilder sb=new StringBuilder();
        int count=0;
        while(!st.isEmpty()){
            if(st.peek()==')'){
                st.pop();
                count++;
            }else if(st.peek()=='('){
                st.pop();
                count--;
            }else if(count==0){
                sb.append(st.pop());
            }else {
                st.pop();
            }

        }
        System.out.println(sb.reverse().toString());

    }

}
