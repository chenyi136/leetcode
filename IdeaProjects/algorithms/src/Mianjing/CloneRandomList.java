package Mianjing;

import java.util.HashMap;

/**
 * @ClassNameCloneRandomList
 * @Author jianwen
 * @Date 19-7-19 下午2:48
 * @Version V1.0
 */

 class RandomListNode {
    int label;
    RandomListNode next = null;
    RandomListNode random = null;

    RandomListNode(int label) {
        this.label = label;
    }
}

public class CloneRandomList {
    public RandomListNode Clone(RandomListNode pHead)
    {
        if(pHead==null) return null;
        RandomListNode res=pHead;
        RandomListNode cur=pHead;
        HashMap<RandomListNode,RandomListNode> map=new HashMap();
        while(cur!=null){
            if(!map.containsKey(cur)){
                RandomListNode node=new RandomListNode(cur.label);
                map.put(cur,node);
            }
        }
        cur=pHead;
        while(cur!=null){
            map.get(cur).next=cur.next;
            map.get(cur).random=cur.random;
            cur=cur.next;
        }
        return map.get(res);
    }
}
