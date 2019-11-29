import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

public class ZigPrintBtree {
    public List<Integer> Print(TreeNode pRoot) {
        List<Integer> result=new ArrayList<>();
        if(pRoot==null) return result;
        Stack<TreeNode> st1=new Stack<TreeNode>();
        Stack<TreeNode> st2=new Stack<TreeNode>();
        TreeNode p=pRoot;
        st1.push(pRoot);
        TreeNode temp;
        boolean isodd=true;
        while(!st1.isEmpty()||!st2.isEmpty()){
            if(isodd){
                while(st1.isEmpty()){
                    temp=st1.pop();
                    result.add(temp.val);
                    if(temp.left!=null) st2.push(temp.left);
                    if(temp.right!=null) st2.push(temp.right);
                }
            }else{
                while(!st2.isEmpty()){
                    temp=st2.pop();
                    result.add(temp.val);
                    if(temp.left!=null) st1.push(temp.left);
                    if(temp.right!=null) st1.push(temp.right);

                }

            }
            isodd=!isodd;


        }
        return result;
    }

}
