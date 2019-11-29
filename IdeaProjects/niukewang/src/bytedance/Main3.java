package bytedance;

import java.util.Scanner;

public class Main3 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int[] numbers=new int[n+1];
        for(int i=1;i<=n;i++){
            numbers[i]=sc.nextInt();
        }
        System.out.println(helper(numbers,numbers[n]/2,n-1));



    }

    public static int helper(int[] numbers,int energe,int index){
        int init=energe;
        if(index==0) return init;
        return helper(numbers,(init+numbers[index])/2,index-1);

    }
}
