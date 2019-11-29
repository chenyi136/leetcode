package graph;

import java.util.Stack;

/**
 * @ClassNameXiaomi
 * @Author jianwen
 * @Date 19-9-6 下午7:40
 * @Version V1.0
 */
public class Xiaomi {

    static String solution(String input) {
        Stack<Character> st=new Stack<>();
        char[] chars=input.toCharArray();
        String res="";
        int k=0;
        Character temp=null;
        for (int i=0;i<chars.length;i++){
            switch (chars[i]){
                case'(':st.push(temp);k=1;break;
                case')':st.pop();break;
                case',':k=2;break;
                default:temp=chars[i];
                        switch (k){
                            case 1:res=res+st.pop();
                            case 2:res=res+st.pop();
                        }
                        break;

            }
        }

        return res;

    }

}
