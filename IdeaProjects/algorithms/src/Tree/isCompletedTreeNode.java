package Tree;

import java.util.LinkedList;
import java.util.Queue;

public class isCompletedTreeNode {
    public boolean iscompleat(TreeNode root){
        if(root==null) return false;
        Queue<TreeNode> queue=new LinkedList<TreeNode>();
        queue.offer(root);

        boolean result=true;
        boolean hasNochild=false;

        while(!queue.isEmpty()){
            TreeNode current=queue.poll();

//           如果前面出现了左右子树未满的情况，即hasNochild 为true 时，又出现一个节点未满，则为非完全二叉树
            if(hasNochild){
                if(current.left!=null||current.right!=null)
                {
                    result=false;
                    break;
                }

            }else{
                if(current.left!=null&&current.right!=null){
                    queue.offer(current.left);
                    queue.offer(current.right);
                }else if(current.left!=null&&current.right==null){
                    queue.offer(current.left);
                    hasNochild=true;
                }else if(current==null&&current.right!=null){
                    result=false;
                    break;
                }else{
                    hasNochild=true;
                }
            }
        }

        return result;
    }
}
