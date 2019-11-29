package binaryTree;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @ClassNameSearchRange
 * @Author jianwen
 * @Date 19-9-3 下午12:04
 * @Version V1.0
 */
public class SearchRange {
    public List<Integer> searchRange(TreeNode root, int k1, int k2) {
        // write your code here

        List<Integer> all=new ArrayList<>();

        inOrder(root,all);
        List<Integer> result=new ArrayList<>();
        for(int i=0;i<all.size();i++){
            int temp=all.get(i);
            if(temp>=k1&&temp<=k2){
                result.add(temp);
            }
        }
        return result;

    }

    public void inOrder(TreeNode root,List<Integer> list){
        if(root!=null){
            inOrder(root.left,list);
            list.add(root.val);
            inOrder(root.right,list);
        }
    }


    //递归写法
     ArrayList<Integer> searchRange2(TreeNode root, int k1, int k2) {
        // write your code here
         ArrayList<Integer> searchList = new ArrayList<>();
         if(null==root) return searchList;
        if(root.val>=k1&&root.val<=k2){
            searchList.add(root.val);
            searchRange(root.left, k1, k2);
            searchRange(root.right, k1, k2);
        }else if(root.val<k1){
            searchRange(root.right, k1, k2);
        }else if(root.val>k2){
            searchRange(root.left, k1, k2);
        }
        Collections.sort(searchList);
        return searchList;
    }


}
