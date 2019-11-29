import java.util.LinkedList;
import java.util.List;

public class tree1 {
    List treeList = new LinkedList();
    public List inorderTraversal(TreeNode root) {
        if(root==null) return new LinkedList();
        inorderTraversal(root.left);
        treeList.add(root.val);
        inorderTraversal(root.right);
        return treeList;
    }
}
