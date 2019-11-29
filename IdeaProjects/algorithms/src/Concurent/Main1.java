package Concurent;


import java.util.Scanner;

/**
 * @ClassNameMain1
 * @Author jianwen
 * @Date 19-9-1 下午8:16
 * @Version V1.0
 */
public class Main1 {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n=in.nextInt();
        int m=in.nextInt();
//        ArrayList<Integer> a=new ArrayList<>();
//        ArrayList<Integer> b=new ArrayList<>();
        int[]a=new int[n];
        int[]b=new int[m];

        for(int i=0;i<n;i++){
//           a.add(in.nextInt());
            a[i]=in.nextInt();

        }
        for(int i=0;i<m;i++){
//           b.add(in.nextInt());
            b[i]=in.nextInt();

        }
        int odda=numbersOdd(a);
        int oddb=numbersOdd(b);

        int count=(Math.min(odda,m-oddb)+Math.min(n-odda,oddb));

        System.out.println(count);


    }
    public static  int numbersOdd(int[] nums){
        int number=0;
        for(int temp:nums){
            if(temp%2==1){
                number++;
            }
        }
        return number;
    }
}
