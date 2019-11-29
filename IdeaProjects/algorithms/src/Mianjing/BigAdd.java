package Mianjing;

import java.util.Scanner;

/**
 * @ClassNameBigAdd
 * @Author jianwen
 * @Date 19-8-18 下午2:56
 * @Version V1.0
 */
public class BigAdd {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

            String s = sc.nextLine();
            String[] sn = s.split(" ");
            System.out.println(add(sn[0], sn[1]));

    }

    private static String add(String str1, String str2) {
        int alen=str1.length(),blen=str2.length();
        StringBuilder s1=new StringBuilder(str1).reverse();
        StringBuilder s2=new StringBuilder(str2).reverse();
        StringBuilder result=new StringBuilder();
        int len;
        if(alen<blen){
            len=blen;
            int count=blen-alen;
            while(count-->0){
                s1.append('0');
            }
        }else {
            len=alen;
            int count=alen-blen;
            s2.append('0');
        }
        int overflow=0;
        int temp;
       for(int i=0;i<len;i++){
           temp=s1.charAt(i)-'0'+s2.charAt(i)-'0'+overflow;
           result.append(temp%10);
           overflow=temp/10;
       }
       if(overflow==1){
           result.append(overflow);
       }

        return result.reverse().toString();
    }

}
