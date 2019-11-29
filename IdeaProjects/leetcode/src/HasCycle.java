public class HasCycle {
    public boolean hasCycle(ListNode head) {
        if(head==null||head.next==null) return false;
        if(head.next==head) return true;
        ListNode nextNode=head.next;
        head.next=head;
        boolean cycle=hasCycle(nextNode);
        return cycle;
    }

    public static void main(String[] args) {

    }
}
