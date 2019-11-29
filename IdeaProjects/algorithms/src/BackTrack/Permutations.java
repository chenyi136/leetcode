package BackTrack;

/**
 * @ClassNamePermutations
 * @Author jianwen
 * @Date 19-9-28 下午7:59
 * @Version V1.0
 */

import java.util.ArrayList;

/**
 * 求一个数组的所有排列，eg [1,2,3] [1,3,2],[2,3,1]....
 */
public class Permutations {
    static ArrayList<ArrayList<Integer>> res=new ArrayList<>();
    public static void main(String[] args) {
        int[] nums={1,2,3,4};
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
    public static void backTrack(ArrayList<Integer> temp,int[] nums,boolean[]flag){
        if(temp.size()==nums.length) res.add(new ArrayList<>(temp));
        else{
            for(int i=0;i<nums.length;i++){
                        if(flag[i]==true) continue;
                        flag[i]=true;
                        temp.add(nums[i]);

                        backTrack(temp, nums,flag);
                        temp.remove(temp.size() - 1);
                        flag[i]=false;

            }
        }
    }
}
