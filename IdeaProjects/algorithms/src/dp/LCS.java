package dp;

import java.util.Arrays;
import java.util.List;

public class LCS {
//    private static final java.util.Arrays Arrays = ;

    public static void main(String[] args) {
//        List<String> X = Arrays.asList("A","B","C","B","D","A","B");
//        List<String> Y = Arrays.asList("B","D","C","A","B","A");
//        int m = X.size(); //X的长度
//        int n = Y.size(); // Y的长度
//        String[][] b = LCS_length(X, Y); //获取维护表b的值
//
//        print_LCS(b, X, m, n); // 输出LCS
//
//    }
//
//    public static String[][] LCS_length(List X,List Y){
//        int m=X.size();
//        int n=Y.size();
//        int [][] c=new int [m+1][n+1];
//        String[][] b=new String [m+1][n+1];
//
//        for(int i=1;i<m+1;i++){
//            for(int j=1;j<n+1;j++){
//                c[i][j]=0;
//                b[i][j]="";
//            }
//        }
//
//        //利用自底向上的动态规划方法获取ｂ和ｃ　的值
//
//
//        for(int i=1;i<m+1;i++){
//            for(int j=1;j<n+1;j++){
//                if(X.get(i-1) == Y.get(j-1)){
//                    c[i][j] = c[i-1][j-1]+1;
//                    b[i][j] = "diag";
//                }
//                else if(c[i-1][j] >= c[i][j-1]){
//                    c[i][j] = c[i-1][j];
//                    b[i][j] = "up";
//                }
//                else{
//                    c[i][j] = c[i][j-1];
//                    b[i][j] = "left";
//                }
//            }
//        }
//
//    }
//
//    // 输出最长公共子序列
//    public static int print_LCS(String[][] b, List X, int i, int j){
//
//        if(i == 0 || j == 0)
//            return 0;
//
//        if(b[i][j].equals("diag")){
//            print_LCS(b, X, i-1, j-1);
//            System.out.print(X.get(i-1)+" ");
//        }
//        else if(b[i][j].equals("up"))
//            print_LCS(b, X, i-1, j);
//        else
//            print_LCS(b, X, i, j-1);
//
//        return 1;
//    }
//}
    }

}
