package sentang;

import java.util.Scanner;

/**
 * @ClassNameMain3
 * @Author jianwen
 * @Date 19-9-21 下午7:58
 * @Version V1.0
 */
public class Main3 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int x=sc.nextInt();

            if(x<100) {
                int i = x % 10;
                int j = x / 10;
                System.out.println((int) Math.ceil((n - i) / j));
            }else{
                int k=10;
                while(countNum(n,x,k)){
                   k++;
                }
                System.out.println(k);
            }

    }
    public static  boolean countNum(int target,int num,int k){
        int temp=0;
        int x=num;
        int index=0;
        while(x>0){
            temp+=(x%10)*Math.pow(k,index);
            x/=10;
            index++;
        }
        return temp<target;
    }

}
