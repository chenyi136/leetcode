import java.util.ArrayList;
import java.util.List;

public class Permutations {
    public List<List<Integer>> permute(int[] nums) {
        List<List<Integer>> result = new ArrayList<List<Integer>>();

        result.add(new ArrayList<Integer>());
        for (int i = 0; i < nums.length; i++) {
            ArrayList<ArrayList<Integer>> current = new ArrayList<ArrayList<Integer>>();
            for (List<Integer> l : result) {
                for (int j = 0; j < l.size() + 1; j++) {
                    l.add(j, nums[i]);
                    ArrayList<Integer> temp = new ArrayList<Integer>(l);
                    current.add(temp);
                    l.remove(j);
                }
            }
            result = new ArrayList<List<Integer>>(current);
        }
        return result;
    }
    }

