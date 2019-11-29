import java.util.LinkedList;
import java.util.List;

public class ZigZagTree {

    public static List<List<Integer>> zigzagLevelOrder(TreeNode root){
        List<List<Integer>> result=new LinkedList<>();
        if(root==null) return result;
        LinkedList<TreeNode> list=new LinkedList<TreeNode>();
        boolean leftToRight=true;
        list.add(root);
        while(!list.isEmpty()){
            int size=list.size();
            LinkedList<Integer> clist=new LinkedList<Integer>();
            if(leftToRight){
                for(int i=0;i<size;i++){
                    TreeNode curr=list.remove();
                    clist.add(curr.val);
                    if(curr.left!=null) list.add(curr.left);
                    if(curr.right!=null) list.add(curr.right);
                }
            }
            else {
                for(int i=0;i<size;i++){
                    TreeNode curr=list.remove(list.size()-1);
                    clist.add(curr.val);
                    if(curr.right!=null) list.add(0,curr.right);
                    if(curr.right!=null) list.add(0,curr.left);

                }
            }
            result.add(clist);
            leftToRight=!leftToRight;
        }
        return result;

    }
}

