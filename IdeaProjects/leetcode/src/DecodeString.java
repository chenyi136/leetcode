/**
 * @ClassNameDecodeString
 * @Author jianwen
 * @Date 19-10-2 下午12:00
 * @Version V1.0
 */

import java.util.Stack;

/**
 1.递归法：
 ３[a]2[bc]
 3[a2[c]]
 2[abc]3[cd]ef
 遍历字符串，１　数字　２［　３字母　４］
 遇到［　递归下去，将递归的结果与前面的数字组装，遇到　］递归出口，返回e激发

 解法２：用两个栈：１.重复数字的栈　２．前一个结果字符串的栈
 */
public class DecodeString {
    static int i=0;
    public static void main(String[] args) {
        System.out.println(decode2("3[a]2[bc]"));
    }

    public static String decode(String s){

        StringBuilder res=new StringBuilder();
        int counts=0;
        while(i<s.length()){

            char temp=s.charAt(i);
            i++;
            if(temp>='0'&&temp<='9'){
                counts=counts*10+temp-'0';
            }else if(temp=='['){
                String sb=decode(s);
                for(int j=0;j<counts;j++){
                    res.append(sb);
                }
                counts=0;
            }else if(temp==']'){
              return res.toString();
            }else{
                res.append(temp);
            }
        }
        return res.toString();
    }

    public static String decode2(String s){
        String res = "";
        Stack<Integer> countStack = new Stack<>();
        Stack<String> resStack = new Stack<>();
        int idx = 0;
        while (idx < s.length()) {
            if (Character.isDigit(s.charAt(idx))) {
                int count = 0;
                while (Character.isDigit(s.charAt(idx))) {
                    count = 10 * count + (s.charAt(idx) - '0');
                    idx++;
                }
                countStack.push(count);
            }
            else if (s.charAt(idx) == '[') {
                resStack.push(res);
                res = "";
                idx++;
            }
            else if (s.charAt(idx) == ']') {
                StringBuilder temp = new StringBuilder (resStack.pop());
                int repeatTimes = countStack.pop();
                for (int i = 0; i < repeatTimes; i++) {
                    temp.append(res);
                }
                res = temp.toString();
                idx++;
            }
            else {
                res += s.charAt(idx++);
            }
        }
        return res;

    }



}
