package redbook;

import java.util.Scanner;



/**
 * @ClassNameMain1
 * @Author jianwen
 * @Date 19-9-14 下午3:18
 * @Version V1.0
 */
public class Main1 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int [][] grid=new int[n][n];
        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++){
                grid[i][j]=sc.nextInt();
            }
        }
        System.out.println(numsOfRed(grid));
    }
    public static int numsOfRed(int[][] grid) {
        if(grid.length==0||grid[0].length==0) return 0;
        int islandCount=0;
        int row=grid.length;
        int col=grid[0].length;
        for(int i=0;i<row;i++){
            for(int j=0;j<col;j++){
                if(grid[i][j]==1){
                    islandCount++;
                    sink(grid,i,j);
                }
            }
        }
        return islandCount;
    }
     static void sink(int[][] grid,int i,int j){
        if(i<0 || j<0 || i>=grid.length||j>=grid[0].length){
            return;
        }
        if(grid[i][j]==0) return;
        grid[i][j] = 0;

        sink(grid,i-1,j);
        sink(grid,i,j-1);
        sink(grid,i+1,j);
        sink(grid,i,j+1);

    }
}
