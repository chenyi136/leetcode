package Mianjing;

/**
 * @ClassNamereverse
 * @Author jianwen
 * @Date 19-7-14 下午5:21
 * @Version V1.0
 */
public class reverse {
    public static ListNode reverse(ListNode head,int k){
        ListNode current=head;
        ListNode next=null;
        ListNode pre=null;
        int count=0;
        while(current!=null&&count<k){
            next=current.next;
            current.next=pre;
            pre=current;
            current=next;
            count++;
        }

        if(next!=null){
            head.next=reverse(next,k);
        }
        return pre;
    }

}
