import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

/**
 * @ClassNameAntiClockWiseTravel
 * @Author jianwen
 * @Date 19-8-22 下午2:51
 * @Version V1.0
 *
 */

/**
 * 逆序打印二叉树最外围加点，左　下　右　节点
 */
public class AntiClockWiseTravel {
    private ArrayList<TreeNode> antiClockWiseNodeList=new ArrayList<>();
    private TreeNode root;

    public AntiClockWiseTravel(TreeNode root) {
        this.root = root;
        getLeftSizeNodes();
        getBottomSizeNodes();
        getRightSizeNodes();
    }



    public ArrayList<TreeNode> getAntiClockWiseNodes() {
        return antiClockWiseNodeList;
    }

    private void getLeftSizeNodes() {
        TreeNode node=root;
        while(node!=null){
            antiClockWiseNodeList.add(node);
            node=node.left;
        }
    }

    private void getBottomSizeNodes() {
        TreeNode node=root;
        inOrder(root);
    }


    private void getRightSizeNodes() {
        TreeNode node=root;
        Stack<TreeNode> stack=new Stack<>();
        while(node!=null){
            stack.push(node);
            node=node.right;
        }
        while(stack.isEmpty()){
            TreeNode temp=stack.pop();
            if(antiClockWiseNodeList.get(antiClockWiseNodeList.size()-1)!=temp){
                antiClockWiseNodeList.add(temp);
            }

        }

    }
    private void inOrder(TreeNode node) {
        if(node==null) return;
        inOrder(node.left);
        if(node.left==null&&node.right==null){
            if(antiClockWiseNodeList.get(antiClockWiseNodeList.size()-1)!=node){
                antiClockWiseNodeList.add(node);
            }
            return;
        }
        inOrder(node.right);
    }
}
