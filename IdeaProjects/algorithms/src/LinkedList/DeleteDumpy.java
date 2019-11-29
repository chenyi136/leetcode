package LinkedList;



/**
 * @ClassNameDeleteDumpy
 * @Author jianwen
 * @Date 19-10-16 下午10:38
 * @Version V1.0
 */
public class DeleteDumpy {
    public ListNode deleteDuplication(ListNode pHead){
        if(pHead==null) return null;
        ListNode firstNode=new ListNode(-1);
        firstNode.next=pHead;
        ListNode cur=pHead;
        ListNode pre=null;
        while(cur!=null&&cur.next!=null){
            if(cur.val==cur.next.val) {
                int val = cur.val;
                while (cur != null && cur.val == val) {
                    cur = cur.next;
                }
            }else{
                pre=cur;
                cur=cur.next;
            }
        }
        return firstNode.next;


    }
}
