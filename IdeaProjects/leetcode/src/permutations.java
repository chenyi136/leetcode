import java.util.ArrayList;
import java.util.List;

public class permutations {
    public static List<List<Integer>> permute(int[] nums) {
        List<List<Integer>> result = new ArrayList<>();

        if (nums == null || nums.length == 0) {
            return result;
        }

        dfs(result,new ArrayList<Integer>(),nums,new boolean[nums.length]);
        return result;

    }

    static void dfs(List<List<Integer>> list, List<Integer> temp, int[] nums, boolean[] hasUsed) {
        if(temp.size()==nums.length){
            list.add(new ArrayList<>(temp));

        }
        for(int i=0;i<nums.length;i++){
           if(!hasUsed[i]){
               hasUsed[i]=true;
               temp.add(nums[i]);
//               System.out.println(temp);
               dfs(list,temp,nums,hasUsed);
               temp.remove(temp.size()-1);// 递归结束，还原该点的状态，使得获取下一个组合的遍历还能再经过此点
               hasUsed[i]=false;// 访问标记还原
           }
        }
    }

    public static void main(String[] args) {
        int [] a=new int[] {1,2,3,4};

        System.out.println(permute(a));
    }


}
