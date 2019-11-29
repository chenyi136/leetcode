import java.util.ArrayList;
import java.util.List;

public class n3 {
    public ArrayList<Integer> printListFromTailToHead(ListNode listNode) {
        List list = new ArrayList<Integer>();
        if (listNode != null) {
            if (listNode.next != null) {
                printListFromTailToHead(listNode.next);
            }
            list.add(listNode.val);
        }
        return (ArrayList<Integer>) list;

    }

}
