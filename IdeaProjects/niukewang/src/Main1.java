import java.util.Scanner;
public class Main1 {
//    public static void main(String[] args) {
//        Scanner sc = new Scanner(System.in);
//        int m = sc.nextInt();
//        int n = sc.nextInt();
//        int k = sc.nextInt();
//
//
//        int flag[][] = new int[m][n];
//        int count=helper(0, 0, m, n, flag, k);
//        System.out.println(count);
//    }
//
//
//        public static int helper(int i, int j, int rows, int cols, int[][] flag, int threshold) {
//            if (i < 0 || i >= rows || j < 0 || j >= cols || numSum(i) + numSum(j)  > threshold || flag[i][j] == 1) return 0;
//            flag[i][j] = 1;
//            return helper(i - 1, j, rows, cols, flag, threshold)
//                    + helper(i + 1, j, rows, cols, flag, threshold)
//                    + helper(i, j - 1, rows, cols, flag, threshold)
//                    + helper(i, j + 1, rows, cols, flag, threshold)
//                    + 1;
//        }
//
//        public static int numSum(int i) {
//            int sum = 0;
//            do{
//                sum += i%10;
//            }while((i = i/10) > 0);
//            return sum;
//        }
public int movingCount(int threshold, int rows, int cols)
{
    boolean[][] visited=new boolean[rows][cols];
    int count=move(threshold,rows,cols,0,0,visited);
    return count;
}
    public int move(int threshold,int rows,int cols,int row,int col,boolean[][] visited){
        if(row<0||row>=rows||col<0||col>=cols||digitsum(row)+digitsum(col)>threshold||visited[row][col]==true) return 0;
        visited[row][col]=true;
        return 1+move(threshold,rows,cols,row-1,col,visited)+
                move(threshold,rows,cols,row+1,col,visited)+move(threshold,rows,cols,row,col-1,visited)+
                move(threshold,rows,cols,row,col+1,visited);
    }
    public int digitsum(int num){
        int sum=0;
        while(num!=0){
            sum+=num%10;
            num=num/10;
        }
        return sum;
    }
}
