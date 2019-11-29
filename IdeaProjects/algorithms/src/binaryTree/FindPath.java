package binaryTree;

import java.util.ArrayList;
import java.util.Stack;

/**
 * @ClassNameFindPath
 * @Author jianwen
 * @Date 19-9-3 上午11:40
 * @Version V1.0
 * 输入一个二叉树，打印出二叉树中节点值的和等于输入整数的所有路径
 */
public class FindPath {
    ArrayList<ArrayList<Integer>> pathList = new ArrayList<ArrayList<Integer>>();
    ArrayList<Integer> path = new ArrayList<Integer>();

    public ArrayList<ArrayList<Integer>> FindPath(TreeNode root,int target) {
        if(root == null)
            return  pathList;
        path.add(root.val);
        if(root.left == null && root.right == null && target == root.val)
        {
            pathList.add(new ArrayList<Integer>(path));
        }
        if(root.val <= target && root.left != null){
            FindPath(root.left,target-root.val);
        }
        if(root.val <= target && root.right != null)
        {
            FindPath(root.right,target-root.val);
        }
        path.remove(path.size()-1);//回退到父节点
        return pathList;
    }


}
