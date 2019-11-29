package BackTrack;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassNameSubSet2
 * @Author jianwen
 * @Date 19-9-28 下午9:31
 * @Version V1.0
 */
public class SubSet2 {
    static ArrayList<ArrayList<Integer>> res;
    public static void main(String[] args) {
        int[] nums={1,2,2,4};

        for(List a: subSets(nums)){
            System.out.println(a);
        }
    }


    public static List<List<Integer>> subSets(int[] nums) {
        List<List<Integer>> res=new ArrayList<>();
        List<Integer> tempList=new ArrayList<Integer>();
        if(nums==null) return  res;

        helper(res,tempList,nums,0);
        return  res;
    }
    public static void helper(List<List<Integer>> res, List<Integer> tempList, int[] nums, int index) {
        res.add(new ArrayList<>(tempList));
        for (int i = index; i < nums.length; i++) {
            if(i > index && nums[i] == nums[i-1]) continue; // skip duplicates
            tempList.add(nums[i]);
            helper(res, tempList, nums, i + 1);
            tempList.remove(tempList.size()-1);
        }
    }
}
