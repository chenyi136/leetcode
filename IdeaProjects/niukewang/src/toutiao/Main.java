package toutiao;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);

        String str=sc.nextLine();
        String[] strs=str.split(" ");

        int[] nums=new int[strs.length];

        for(int i=0;i<strs.length;i++){
            nums[i]=Integer.valueOf(strs[i]);
        }
        List<List<Integer>> result=permute(nums);

        for(int i=0;i<result.size();i++){
            String temp = "";
            for(int j=0;j<result.get(i).size();j++) {

                temp +=result.get(i).get(j);
            }
            System.out.print(Integer.valueOf(temp));
            System.out.print(" ");
        }




    }

    public static List<List<Integer>> permute(int[] nums) {
        List<List<Integer>> list = new ArrayList<>();

        backtrack(list, new ArrayList<>(), nums);
        return list;
    }

    private static void backtrack(List<List<Integer>> list, List<Integer> tempList, int [] nums){
        if(tempList.size() == nums.length){
            list.add(new ArrayList<>(tempList));
        } else{
            for(int i = 0; i < nums.length; i++){
                if(tempList.contains(nums[i])) continue; // element already exists, skip
                tempList.add(nums[i]);
                backtrack(list, tempList, nums);
                tempList.remove(tempList.size() - 1);
            }
        }
    }

}

