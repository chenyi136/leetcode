package netEasy;

import java.util.Arrays;
import java.util.Scanner;

/**
 * @ClassNametest1
 * @Author jianwen
 * @Date 19-8-3 下午3:35
 * @Version V1.0
 */
public class test1 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n=in.nextInt();
        int[] counts=new int[n];
        int[] counts2=new int[n];
        for(int i=0;i<n;i++){
             int temp=in.nextInt();
             counts[i]=temp;
             counts2[i]=temp;
        }
        Arrays.sort(counts);

        int k=in.nextInt();

        for(int i=0;i<k;i++){
            int index=in.nextInt();
            int less=count(counts,counts2[index-1]);
            double num=(less-1.0)/n*100;
            String percent=String.format("%.6f",num);
            System.out.println(percent);
        }
        }
    public static int count(int[]counts,int a){

        int i=0;
        while(counts[i]<=a){
            i++;
        }
        return i+1;
    }
}
