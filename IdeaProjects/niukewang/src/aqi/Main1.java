package aqi;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


public class Main1 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        int[] seqs=new int[n-1];
        for(int i=0;i<n-1;i++){
            seqs[i]=sc.nextInt();
        }
//

        List<List<Integer>> list = new ArrayList<>();

        backtrack(list, new ArrayList<>(), n,seqs);
        System.out.println(list.size());
//        %(10E9+7)

    }

    private static void backtrack(List<List<Integer>> list, List<Integer> tempList, int  num,int[]seqs){
        if(tempList.size() == num&&manzu(tempList,seqs)){

            list.add(new ArrayList<>(tempList));

        } else{
            for(int i = 0; i < num; i++){
                if(tempList.contains(i+1)) continue; // element already exists, skip
                tempList.add(i+1);
                backtrack(list, tempList, num,seqs);
                tempList.remove(tempList.size() - 1);
            }
        }
    }

    public static boolean manzu(List<Integer> templist,int[] seqs){
        for(int i=0;i<seqs.length;i++){
            if(seqs[i]==1&& templist.get(i)<templist.get(i+1)){
               return false;
            }
            if(seqs[i]==0&&templist.get(i)>templist.get(i+1)){
                return false;
            }
        }
        return true;
    }

}
