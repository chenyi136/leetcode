package ByteDaance915;

import java.util.ArrayList;
import java.util.Scanner;

/**
 * @ClassNameMain4
 * @Author jianwen
 * @Date 19-9-15 下午9:27
 * @Version V1.0
 */
public class Main4 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int[][] nums=new int[n][3];
        for(int i=0;i<n;i++){
            for(int j=0;j<3;j++){
                nums[i][j]=sc.nextInt();
            }

        }
        ArrayList<Integer>[] trees=new ArrayList[n+1];
        for(int i=0;i<nums.length;i++){
            trees[nums[i][0]].add(nums[i][1]);
        }
//        int[] res=new int[n+1];
//        for(int i=1;i<=n;i++)
//        while(!trees[i].isEmpty()){
//            res[i]+=
//        }

    }
}
