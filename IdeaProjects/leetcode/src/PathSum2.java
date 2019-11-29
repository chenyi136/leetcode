import java.util.ArrayList;
import java.util.List;


public class PathSum2 {

    List<List<Integer>> res = new ArrayList<>();
    List<Integer> tmpRes = new ArrayList<>();

    public List<List<Integer>> pathSum(TreeNode root, int sum) {
        List<List<Integer>> result=new ArrayList<List<Integer>>();
        ArrayList<Integer> currentresult=new ArrayList<Integer>();

        path(root,sum,currentresult,result);
        return result;

    }
    public void path(TreeNode node,int sum,List currentresult,List result){
        if(node==null) return ;
        currentresult.add(node.val);
        if(node.left==null&&node.right==null&&node.val==sum){

            result.add(new ArrayList(currentresult));
            currentresult.remove(currentresult.size()-1);
            return;
        }else
        {

            path(node.left,sum-node.val,currentresult,result);
            path(node.right,sum-node.val,currentresult,result);

        }

        currentresult.remove(currentresult.size()-1);


    }
}
