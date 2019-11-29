package BackTrack;

/**
 * @ClassNamePermutation2
 * @Author jianwen
 * @Date 19-9-28 下午8:45
 * @Version V1.0
 */

import java.util.ArrayList;

/**
 * 求数组的全部排列，数组中　有重复数字，［１，２，２，４］
 */
public class Permutations2 {
    static ArrayList<ArrayList<Integer>> res=new ArrayList<>();
    public static void main(String[] args) {
        int[] nums={1,2,2,4};
        ArrayList<ArrayList<Integer>> res=permute(nums);
        for(ArrayList a:res){
            System.out.println(a);
        }
    }
    public static ArrayList<ArrayList<Integer>> permute(int[] nums){
        boolean[] flag=new boolean[nums.length];
        ArrayList<Integer> temp=new ArrayList<>();
        backTrack(temp,nums,flag);
        return res;

    }
    public static void backTrack(ArrayList<Integer> temp,int[] nums,boolean[] flag){
        if(temp.size()==nums.length&&!res.contains(temp)) res.add(new ArrayList<>(temp));
        else{
            for(int i=0;i<nums.length;i++){
                if(flag[i]==true) continue;
                temp.add(nums[i]);
                flag[i]=true;
                backTrack(temp,nums,flag);
                temp.remove(temp.size()-1);
                flag[i]=false;


            }
        }
    }
}
