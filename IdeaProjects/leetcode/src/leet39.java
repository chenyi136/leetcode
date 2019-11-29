import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class leet39 {
    public List<List<Integer>> combinationSum(int[] nums, int target) {
        List<List<Integer>> list = new ArrayList<>();
        Arrays.sort(nums);
        backtrack(list, new ArrayList<>(), nums, target, 0);
        return list;
    }

    private void backtrack(List<List<Integer>> list, ArrayList<Integer> templist, int[] nums, int remains, int start) {
        if(remains<0) return;
        else if (remains==0) list.add(templist);
        else{
            for(int i=start;i<nums.length;i++){
                templist.add(nums[i]);
                backtrack(list,templist,nums,remains-nums[i],i);
                templist.remove(templist.size()-1);
            }
        }
    }


}
