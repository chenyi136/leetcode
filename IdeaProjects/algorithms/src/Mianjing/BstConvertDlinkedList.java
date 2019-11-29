package Mianjing;

/**
 * @ClassNameBstConvertDlinkedList
 * @Author jianwen
 * @Date 19-10-16 下午12:50
 * @Version V1.0
 */
public class BstConvertDlinkedList {
    TreeNode cur=null;//定义当前节点
    TreeNode head=null;//定义链表头部节点

    public TreeNode convert(TreeNode root){
        if(root==null) return null;
        convert(root.left);
        if(head==null){
            cur=root;
            head=root;
        }else{
            cur.right=root;
            root.left=cur;
            cur=root;
        }
        convert(root.right);
        return head;

    }

//     TreeNode pre = null;
//     public TreeNode Convert(TreeNode pRootOfTree) {
//     if(pRootOfTree == null){
//     return null;
//     }
//
//     convertCore(pRootOfTree);
//     TreeNode cur=pRootOfTree;
//     while(cur.left!=null){
//     cur=cur.left;
//     }
//     return cur;
//     }
//     public void convertCore(TreeNode pRootOfTree){
//
//     if(pRootOfTree==null) return;
//     convertCore(pRootOfTree.left);
//     pRootOfTree.left=pre;
//     if(pre!=null){
//     pre.right=pRootOfTree;
//     }
//     pre=pRootOfTree;
//     convertCore(pRootOfTree.right);
//     }
//


}
