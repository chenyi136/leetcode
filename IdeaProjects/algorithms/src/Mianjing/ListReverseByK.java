package Mianjing;

/**
 * @ClassNameListReverseByK
 * @Author jianwen
 * @Date 19-9-23 上午10:35
 * @Version V1.0
 */

/**
 * 用递归的方法，找出前k个加点逆转，后面的递归，然后拼接起来
 */
public class ListReverseByK {
    public  ListNode reversekNode(ListNode head,int k){
        ListNode temp=head;
       for(int i=0;i<k&&temp!=null;i++){
           temp=temp.next;
       }
       if(temp==null){
           return head;
       }
       ListNode next=temp.next;
       temp.next=null;
       //　前面逆转
       ListNode newHead=reverse(head);
       //　递归
       ListNode nextHead=reversekNode(next,k);
       head.next=nextHead;
       return newHead;
    }

    public ListNode reverse(ListNode head){
        if(head==null||head.next==null) return head;
        ListNode pre=null,cur=head;
        while(cur!=null){
            ListNode next=cur.next;
            cur.next=pre;
            pre=cur;
            cur=next;
        }
        return pre;
    }
}
