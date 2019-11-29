package Mianjing;

public class LowestCommenAncestor {
    public static TreeNode lowsetCommenAncestor(TreeNode root,TreeNode p,TreeNode q){
        if(root==null) return null;
        if(root==p||root==q)return root;

        TreeNode left=lowsetCommenAncestor(root.left,p,q);
        TreeNode right=lowsetCommenAncestor(root.right,p,q);
        if(left!=null&&right!=null) return root;
        else if(left==null) return right;
        return left!=null?left:right;
    }
}
