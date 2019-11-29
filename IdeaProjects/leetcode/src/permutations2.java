import java.util.ArrayList;
import java.util.List;

public class permutations2 {
    public List<List<Integer>> permuteUnique(int[] nums) {
        List<List<Integer>> result = new ArrayList<>();

        if (nums == null || nums.length == 0) {
            return result;
        }

        Dfs(result, new ArrayList<Integer>(), nums, new boolean[nums.length]);
        return result;
    }

    private void Dfs(List<List<Integer>> list, ArrayList<Integer> temp, int[] nums, boolean[] hasUsed) {
        if (temp.size() == nums.length && !list.contains(temp)) {
            list.add(new ArrayList<>(temp));

        }
        for (int i = 0; i < nums.length; i++) {
            if (hasUsed[i] || i > 0 && !hasUsed[i - 1] && nums[i] == nums[i - 1]) {
                continue;
            } else {
                {
                    hasUsed[i] = true;
                    temp.add(nums[i]);

                    Dfs(list, temp, nums, hasUsed);
                    temp.remove(temp.size() - 1);// 递归结束，还原该点的状态，使得获取下一个组合的遍历还能再经过此点
                    hasUsed[i] = false;// 访问标记还原
                }
            }
        }
    }
}
