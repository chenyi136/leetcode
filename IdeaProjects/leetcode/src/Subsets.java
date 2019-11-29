import java.util.ArrayList;
import java.util.List;

public class Subsets {
    public static ArrayList<ArrayList<Integer>> sets(int[] nums) {
        ArrayList<ArrayList<Integer>> res = new ArrayList<>();
        ArrayList<Integer> tempList = new ArrayList<Integer>();
        if (nums == null) return res;

        helper(res, tempList, nums, 0);
        return res;
    }


    public static void helper(ArrayList<ArrayList<Integer>> res, ArrayList<Integer> templist, int[] nums, int index) {
        res.add(new ArrayList<>(templist));
        for (int i = index; i < nums.length; i++) {
            templist.add(nums[i]);
            helper(res, templist, nums, i + 1);
        }
    }



}
