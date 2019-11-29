import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class BtreeLevelOrder {
    public List<List<Integer>> levelOrder(TreeNode root) {
        List<List<Integer>>res=new ArrayList<>();
        if(root==null) return res;
        Queue<TreeNode> queue=new LinkedList<TreeNode>();
        queue.offer(root);
        while(!queue.isEmpty()){

            int k=queue.size();
            ArrayList<Integer> arrayList=new ArrayList();
            for(int i=0;i<k;i++){
                TreeNode tempNode=queue.poll();
                arrayList.add(tempNode.val);
                if(tempNode.left!=null)
                    queue.add(tempNode.left);
                if(tempNode.right!=null)
                    queue.add(tempNode.right);
            }
            res.add(arrayList);



        }
        return res;
    }
}
