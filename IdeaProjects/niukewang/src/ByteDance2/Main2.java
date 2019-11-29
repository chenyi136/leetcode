package ByteDance2;

import java.math.BigInteger;
import java.util.Scanner;

/**
 * @ClassNameMain2
 * @Author jianwen
 * @Date 19-9-29 下午7:55
 * @Version V1.0
 */
public class Main2 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        while(sc.hasNext()){
            String s = sc.nextLine();
            String[] ss = s.split(" ");
            BigInteger a = new BigInteger(ss[0]);
            BigInteger b = new BigInteger(ss[1]);
            BigInteger c = new BigInteger(ss[2]);
            int comp = a.add(b).compareTo(c);
            if(comp > 0){
                System.out.println("true");
            }else{
                System.out.println("false");
            }
        }
    }
}

