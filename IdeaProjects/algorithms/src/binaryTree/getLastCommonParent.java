package binaryTree;



/**
 * @ClassNamegetLastCommonParent
 * @Author jianwen
 * @Date 19-9-3 上午11:24
 * @Version V1.0
 */
public class getLastCommonParent {
   public static TreeNode lastCommonParent(TreeNode root,TreeNode t1,TreeNode t2){

       if(findNode(root.left,t1)){
            if(findNode(root.right,t2)) return root;
            else return lastCommonParent(root.left,t1,t2);
       }else{
           if(findNode(root.left,t2)) return root;
           else{
               return lastCommonParent(root.right,t1,t2);
           }
       }
   }
   public static boolean findNode(TreeNode root,TreeNode node){
       if(root==null||node==null){
           return false;

       }
       if(root==node) return true;
       boolean found=findNode(root.left,node);
       if(!found){
           found=findNode(root.right,node);
       }
       return found;
   }


}
