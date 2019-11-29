package binaryTree;

/**
 * @ClassNameisBalancedTree
 * @Author jianwen
 * @Date 19-9-3 下午5:44
 * @Version V1.0
 */
public class isBalancedTree {
    public boolean isBalance(TreeNode root){
        if(root.left==null||root.right==null) return true;
        int left=treeHeight(root.left);
        int right=treeHeight(root.right);
        if(Math.abs(left-right)>1){
            return false;
        }
        return isBalance(root.left)&&isBalance(root.right);

    }

    private int treeHeight(TreeNode root) {
        if(root.left==null&&root.right==null){
            return 1;
        }
        int left=treeHeight(root.left);
        int right=treeHeight((root.right));
        return Math.max(left,right)+1;
    }
}
