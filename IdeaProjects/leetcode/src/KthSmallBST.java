public class KthSmallBST {
    public static int kthSmallest(TreeNode root, int k) {
        int nums=countNodes(root.left);
        if(k<=nums) return kthSmallest(root.left,k);
        else if(k>nums+1) return kthSmallest(root.right,k-1-nums);
        return root.val;
    }
    public static  int countNodes(TreeNode root){
       if(root==null) return 0;
       return 1+countNodes(root.left)+countNodes(root.right);
    }

}
