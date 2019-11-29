public class sortedArrarToBST {
    public TreeNode toBST(int[] nums){
        return helper(nums,0,nums.length-1);

    }

    private TreeNode helper(int[] nums, int left, int right) {
        if(left>right) return null;


        int mid=left+(right-left)>>1;
        TreeNode node=new TreeNode(nums[mid]);
        node.left=helper(nums,left,mid-1);
        node.right=helper(nums,mid+1,right);


        return node;
    }
}

