package Mianjing;

public class BintreeToDoubLinklist {
    private TreeNode head=null;
    private TreeNode tail=null;
    public TreeNode convertLinkList(TreeNode root){

        visit(root);
        return head;
    }
    public void visit(TreeNode tree){
        if(tree==null) return ;
        if(tree.left!=null) visit(tree.left);
        createList(tree);
        if(tree.right!=null) visit(tree.right);
    }
    public void createList(TreeNode cur){
        cur.left=tail;
        if(tail!=null){
            tail.right=cur;
        }else{
            head=cur;
        }
        tail=cur;
    }
}
