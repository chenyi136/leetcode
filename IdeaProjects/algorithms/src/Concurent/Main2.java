package Concurent;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Scanner;

/**
 * @ClassNameMain2
 * @Author jianwen
 * @Date 19-9-1 下午9:14
 * @Version V1.0
 */
public class Main2 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int[]a=new int[n];
        int[]b=new int[n];
        for(int i=0;i<n;i++){
            a[i]=sc.nextInt();
            b[i]=sc.nextInt();
        }
        double[]c=new double[n];
        HashMap<Double,Integer> map=new HashMap();

        for(int i=0;i<n;i++){
            c[i]=b[i]/a[i];
            map.put(c[i],i);
        }
        Arrays.sort(c);
        int sum=0;
      for(double temp:c){
        int index=map.get(temp);
        sum+=(a[index])*(index)+b[index]*(n-index);
      }
        System.out.println(sum);

    }
}
