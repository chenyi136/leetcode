public class leet111 {
    public int minDepth(TreeNode root) {
        if(root==null) return 0;
        int l=minDepth(root.left);
        int r=minDepth(root.right);
        if(root.left==null||root.right==null)
            return l+r+1;
        else return 1+Math.min(l,r);


    }


}
