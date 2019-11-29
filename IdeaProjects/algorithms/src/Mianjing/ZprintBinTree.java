package Mianjing;

import java.util.Stack;

public class ZprintBinTree {
    public void Zprint(TreeNode root){
        if(root==null) return;
        Stack<TreeNode>[] sts=new Stack[2];
        sts[0]=new Stack<>();
        sts[1]=new Stack<>();

        int current=0,next=1;
        sts[current].push(root);
        while(!sts[current].isEmpty()||!sts[next].isEmpty()){
            TreeNode temp=sts[current].pop();

            System.out.println(temp.val);
            if(current==0){


                if(temp.left!=null) sts[next].push(temp.left);
                if(temp.right!=null) sts[next].push(temp.right);
            }else{
                if(temp.right!=null) sts[next].push(temp.right);
                if(temp.left!=null) sts[next].push(temp.left);
            }
            current=1-current;
            next=1-next;
        }

    }
}
