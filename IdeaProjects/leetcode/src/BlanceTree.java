public class BlanceTree {
    public static boolean isBlanced(TreeNode root){
        int depth=0;
        return helper(root,depth);
    }
    public static boolean helper(TreeNode root,int depth){
        if(root==null){
            depth=0;
            return true;
        }
        int left=0,right=0;
        if(helper(root.left,left)&&helper(root.right,right)){
            int diff=left-right;
            if(diff<=1&&diff>=-1){
                depth=1+(left>right?left:right);
                return true;
            }
        }
        return false;
    }

}
