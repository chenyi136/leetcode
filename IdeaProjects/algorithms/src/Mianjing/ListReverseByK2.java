package Mianjing;

/**
 * @ClassNameListReverseByK2
 * @Author jianwen
 * @Date 19-9-23 上午10:57
 * @Version V1.0
 */



/**
 * 如果从尾部开始，每k个节点进行逆转
 * 思考：前面题中，我们解决了从头开始逆转
 * 　　　那现在从尾部，我们可以先将链表进行逆转，对逆转后的链表进行每k个进行逆转，最后将结果进行你装
 *
 *      eg:1->2>3->4->5->6->7->8
 *         8->7->6->5->4->3->2->1
 *         6-7-8-3-4-5-2-1
 *         1-2-5-4-3-8-7-6(满足题意)
 */
public class ListReverseByK2 {
    public ListNode reverseNode(ListNode head,int k){
        ListReverseByK l=new ListReverseByK();
        head=l.reverse(head);
        ListNode newheadl=l.reversekNode(head,k);
        return l.reverse(newheadl);
    }

}
