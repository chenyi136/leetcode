package Test;

import java.util.Scanner;

/**
 * @ClassNameMain
 * @Author jianwen
 * @Date 19-10-12 下午4:32
 * @Version V1.0
 */
public class Main {
    static String GetResult(int N) {
        int count=0;

        for(int i=1;i<=N;i++){
            int res=0;
            int cur=i;
            while(cur>0){
                int temp=i%10;
                cur/=10;
                res+=temp;
            }
            if(i==res) count++;
        }
        return String.valueOf(count);

    }
    /******************************结束写代码******************************/


    public static void main(String[] args){
        Scanner in = new Scanner(System.in);
        String res;

        int _N;
        _N = Integer.parseInt(in.nextLine().trim());

        res = GetResult(_N);
        System.out.println(res);
    }
}
