package test;

import java.awt.*;

/**
 * @ClassNameEvenOdd
 * @Author jianwen
 * @Date 19-9-27 上午12:48
 * @Version V1.0
 */
public class EvenOdd {
    public static ListNode oddEvenList(ListNode head) {
        if(head==null) return null;
        ListNode newHead=new ListNode(-1);
        newHead.next=head;
        ListNode pre=head,cur=head.next;
        while(cur!=null&&cur.next!=null){
            // ListNode temp=pre.next;
            pre.next=cur.next;
            cur.next=cur.next.next;
            pre.next.next=cur;
            ListNode temp=pre.next;
            pre=pre.next;
            cur=cur.next;

        }
        return newHead.next;



    }

    public static void main(String[] args) {
        ListNode l1=new ListNode(1);
        ListNode l2=new ListNode(2);
        ListNode l3=new ListNode(3);
        ListNode l4=new ListNode(4);
        ListNode l5=new ListNode(5);
        l1.next=l2;
        l2.next=l3;
        l3.next=l4;
        l4.next=l5;
        ListNode res=oddEvenList(l1);
        ListNode cur=res;
       while(cur!=null){
           System.out.println(cur.val);
           cur=cur.next;
       }
    }
}
