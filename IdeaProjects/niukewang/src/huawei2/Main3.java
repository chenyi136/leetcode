package huawei2;

import java.util.Scanner;

public class Main3 {
    private static int result=0;
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int m=sc.nextInt();
        int[][] num=new int[n][m];
        for(int i=0;i<n;i++){
            for(int j=0;j<m;j++){
                num[i][j]=sc.nextInt();
            }
        }
        int startx=sc.nextInt();
        int starty=sc.nextInt();
        int endx=sc.nextInt();
        int endy=sc.nextInt();

        int[][]flag=new int[n][m];

        flag[startx][starty]=1;
        helper(startx,starty,endx,endy,flag,num);
        System.out.println(result%1000000000);
    }
    public static void helper(int startx,int starty,int endx,int endy,int[][] flag,int[][]num){
        if(startx==endx&&starty==endy){
            result++;
        }
        if(startx-1>=0&&flag[startx-1][starty]==0&&num[startx-1][starty]>num[startx][starty]){
            flag[startx-1][starty]=1;
            helper(startx-1,starty,endx,endy,flag,num);
            flag[startx-1][starty]=0;
        }

        if(startx+1<num.length&&flag[startx+1][starty]==0&&num[startx+1][starty]>num[startx][starty]){
            flag[startx-1][starty]=1;
            helper(startx+1,starty,endx,endy,flag,num);
            flag[startx-1][starty]=0;
        }
        if(startx-1>=0&&flag[startx][starty-1]==0&&num[startx-1][starty-1]>num[startx][starty]){
            flag[startx-1][starty]=1;
            helper(startx,starty-1,endx,endy,flag,num);
            flag[startx-1][starty]=0;
        }
        if(startx+1<num.length&&flag[startx][starty+1]==0&&num[startx][starty+1]>num[startx][starty]){
            flag[startx][starty+1]=1;
            helper(startx-1,starty,endx,endy,flag,num);
            flag[startx][starty+1]=0;
        }
    }
}
