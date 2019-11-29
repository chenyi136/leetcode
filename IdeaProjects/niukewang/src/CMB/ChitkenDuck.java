package CMB;

import java.util.Scanner;

/**
 * @ClassNameChitkenDuck
 * @Author jianwen
 * @Date 19-9-13 下午11:37
 * @Version V1.0
 */
public class ChitkenDuck {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        String s=sc.nextLine();
        System.out.println(minTimes(s));
    }
    public static int minTimes(String s){
        char[] chars=s.toCharArray();
        int len=chars.length;
        int count=0,index=len-1;
        for(int i=len-1;i>=0;i--){
            if(chars[i]=='D'){
                count+=(index-i);
                index--;
            }
        }
        return count;
    }
}
