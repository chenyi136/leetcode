package binaryTree;

/**
 * @ClassNameMirrorTree
 * @Author jianwen
 * @Date 19-9-3 上午11:37
 * @Version V1.0
 *
 * 判断俩二叉树是否为镜像
 */
public class MirrorTree {
    boolean isMirror(TreeNode t1,TreeNode t2){
        if(t1==null&&t2==null) return true;
        if(t1==null||t2==null) return false;
        if(t1.val!=t2.val) return false;
        return isMirror(t1.left,t2.right)&&isMirror(t1.right,t2.left);
    }

}
