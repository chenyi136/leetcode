package Baidu;

import java.util.Scanner;

/**
 * @ClassNameMain2
 * @Author jianwen
 * @Date 19-9-17 下午5:49
 * @Version V1.0
 */
public class Main2 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int T=sc.nextInt();
        for(int i=0;i<T;i++){
            int n=sc.nextInt();
            int m=sc.nextInt();

            int[]eds=new int[n+1];
            for(int j=0;j<m;j++){
                int index=sc.nextInt();
                eds[index]=sc.nextInt();
            }
            int temp=1;
            int count=0;
            boolean[]flag=new boolean[n+1];
            flag[1]=true;
            while(eds[temp]!=n){
                if(flag[eds[temp]]){System.out.println("IMPOSSIBLE"); return;}
                if(eds[temp]==0) {
                    System.out.println("IMPOSSIBLE");

                    return;
                }
                flag[eds[temp]]=true;
                temp=eds[temp];

                count++;

            }

            count++;

            if(count<=2) {
                System.out.println("POSSIBLE");

            }else{
                System.out.println("IMPOSSIBLE");
            }

        }
    }
}
