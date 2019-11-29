package ByteDaance915;

import org.omg.Messaging.SYNC_WITH_TRANSPORT;

import java.util.Arrays;
import java.util.Scanner;

/**
 * @ClassNameMain
 * @Author jianwen
 * @Date 19-9-15 下午4:08
 * @Version V1.0
 */
public class Main {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        String s=sc.nextLine();
        String[] ns=s.split("RL");
        int n=ns.length;
        System.out.println(n);
        int[] result=new int[s.length()];

            for(int i=0;i<ns[0].length();i++){
                result[i]=0;
            }
            result[ns[0].length()]=(ns[0].length()+2)/2;
            result[ns[0].length()+1]=ns.length-(ns[0].length()+2)/2;
            for(int i=ns[0].length()+2;i<s.length();i++){
                result[i]=1;
            }




    }
}
