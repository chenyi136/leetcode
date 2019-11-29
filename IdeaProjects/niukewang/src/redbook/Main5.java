package redbook;
import java.util.Scanner;
/**
 * @ClassNameMain5
 * @Author jianwen
 * @Date 19-9-14 下午4:58
 * @Version V1.0
 */
public class Main5 {




        public static void main( String[] args ) {
            helper();
        }

        private static void helper() {
            Scanner sc = new Scanner(System.in);
            String s = sc.next();
            String res = "";
            int count = 0, len = s.length();
            for(int i=0;i<len;i++) {
                char c = s.charAt(i);
                if(c == '(') {
                    count ++;
                }else if(c == ')') {
                    count --;
                }else if(c == '<') {
                    if(res.length() > 0 && count == 0 && res.charAt(res.length() - 1) != ')') {
                        res = res.substring(0, res.length() - 1);
                    }
                }else if(count == 0) {
                    res += c;
                }
            }
            System.out.println(res);
        }
    }

