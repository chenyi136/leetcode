package Mianjing;

import java.awt.*;
import java.util.ArrayList;

public class LowestCommenAncestor2 {

    public TreeNode lowcommenAncestor(TreeNode root,TreeNode p,TreeNode q) {
        ArrayList<TreeNode> a = new ArrayList<>();
        ArrayList<TreeNode> b = new ArrayList<>();

        findPath(root, p, a);
        findPath(root, q, b);

        int min=Math.min(a.size(),b.size());

        for(int i=0;i<min;i++){
            if(a.get(i)!=b.get(i))
                return a.get(i-1);
        }
        return a.get(min-1);
    }

    public boolean findPath(TreeNode root, TreeNode p, ArrayList<TreeNode> path){
        if(root==null) return false;
        path.add(root);

        if(root==p) return true;

        if(findPath(root.left, p, path)) {
              return true;
          }

          if(findPath(root.right, p, path)) {
              return true;
          }

          path.remove(path.size() - 1);
          return false;
    }
}
