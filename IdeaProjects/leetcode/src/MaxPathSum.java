/**
 * @ClassNameMaxPathSum
 * @Author jianwen
 * @Date 19-11-18 下午3:26
 * @Version V1.0
 */
public class MaxPathSum{
    int max=Integer.MIN_VALUE;
    public int maxPathSum(TreeNode root){
        if(root==null){
            return 0;
        }
        helper(root);
        return max;
    }
    private int helper(TreeNode root){
        int left=root.left!=null?Math.max(helper(root.left),0):0;
        int right=root.right!=null?Math.max(helper(root.right),0):0;
        int cur=root.val+left+right;
        max=Math.max(max,cur);
        return root.val+Math.max(left,right);
    }
}
