import java.util.ArrayList;

public class LowCommonAncestor {
    public static  TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        if(root==null) return null;
        if(root==p||root==q)  return root;
        TreeNode left = lowestCommonAncestor(root.left, p, q);
        TreeNode right = lowestCommonAncestor(root.right, p, q);
        if(left!=null&&right!=null) return root;
        else if(left==null) return right;
        return left!=null ? left : right;
    }



}
