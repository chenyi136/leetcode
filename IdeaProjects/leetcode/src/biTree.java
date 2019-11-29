/**
 * Definition for binary tree
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */

public class biTree {
    public TreeNode reConstructBinaryTree(int [] pre,int [] in) {
        if (pre == null || in == null || pre.length != in.length)
            return null;

        return createTree(pre, 0, pre.length - 1, in, 0, in.length - 1);
    }








    TreeNode createTree(int[]pre,int ps,int pe,int[]in ,int is,int ie){
        if(ps > pe) return null;
        int value=pre[ps];
        int index=is;
        while(index<=ie&&value!=in[index]){
            index++;
        }
        if(index>ie) return null;
        TreeNode node = new TreeNode(value);
        node.left = createTree(pre, ps+1, ps+index-is, in, is, index-1);
        // 递归调用构建当前节点的右子树
        node.right = createTree(pre, ps+index-is+1, pe, in, index+1, ie);

        return node;

    }


}
