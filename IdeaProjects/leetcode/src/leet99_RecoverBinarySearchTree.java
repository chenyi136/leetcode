/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */




public class leet99_RecoverBinarySearchTree {

    //
    TreeNode prevalNode=null;
    TreeNode firstNode=null;
    TreeNode secondNode=null;

    TreeNode prevElement = new TreeNode(Integer.MIN_VALUE);
    public void recoverTree (TreeNode root) {
        traverse(root);
        int tmp=firstNode.val;
        firstNode.val=secondNode.val;
        secondNode.val=tmp;

    }

    private void traverse(TreeNode root) {
        traverse(root.left);



        if(firstNode==null&&prevalNode.val>=root.val) {
            firstNode = prevalNode;
            //prevalNode=root;
        }
        if(firstNode!=null&&prevalNode.val>=root.val) {
            secondNode=root;
        }
        //

        traverse(root.right);
    }
}

