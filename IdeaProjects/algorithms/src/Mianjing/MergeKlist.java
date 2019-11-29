package Mianjing;

import java.util.List;

/**
 * 时间复杂度：nklogk(理解怎么计算得出来的)
 */


public class MergeKlist {
    void mergeKlists(ListNode[] lists){
        if(lists==null) return;
        int n=lists.length;
        while(n>1){
//            此处理解为什么要加１
            int k=(1+n)/2;
            for(int i=0;i<k;i++){
                lists[i]=mergeTwoLists(lists[i],lists[i+k]);
            }
            n=k;
        }
    }


    ListNode mergeTwoLists(ListNode lista,ListNode listb){

        ListNode head=new ListNode(-1),cur=head;
        ListNode a=lista,b=listb;
        while(a!=null&&b!=null){
            if(a.val<b.val){
                cur.next=a;
                a=a.next;
            }else{
                cur.next=b;
                b=b.next;
            }

            cur=cur.next;

        }
        if(a==null) cur.next=b;
        if(b==null) cur.next=a;

        return head.next;

    }
}
