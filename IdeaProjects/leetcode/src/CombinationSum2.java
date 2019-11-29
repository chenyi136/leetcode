import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CombinationSum2 {
    public static void main(String[] args) {
        int [] candidates={2,3,6,7};
        for(List<Integer> temp:combinationSum2(candidates,7)){
            System.out.println(temp);
        }

    }
    public static List<List<Integer>> combinationSum2(int[] candidates, int target) {
        List<List<Integer>> result=new ArrayList<>();
        if(candidates==null||candidates.length==0) return result;
        Arrays.sort(candidates);

        helper(result,new ArrayList<>(),candidates,target,0);
        return result;
    }

    public static void helper(List<List<Integer>> result,List<Integer> tempList,int[] candidates,int target,int index ){
        if(target<0) return;
        if(target==0) result.add(new ArrayList<>(tempList));

            for (int i = index; i < candidates.length; i++) {

                tempList.add(candidates[i]);
                helper(result, tempList, candidates, target - candidates[i], i);
                tempList.remove(tempList.size() - 1);


            }

    }
}
