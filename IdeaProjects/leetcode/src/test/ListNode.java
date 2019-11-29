package test;

/**
 * @ClassNameListNode
 * @Author jianwen
 * @Date 19-9-27 上午12:49
 * @Version V1.0
 */
public class ListNode {
    int val;
    ListNode next;
    ListNode(int x) { val = x; }

    @Override
    public String toString() {
        return ""+val+"->"+next.val;
    }
}
