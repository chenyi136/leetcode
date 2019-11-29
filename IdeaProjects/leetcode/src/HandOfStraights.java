import java.util.PriorityQueue;
import java.util.TreeMap;

public class HandOfStraights {
    public boolean isNStraightHand(int[] hand, int W) {
        PriorityQueue<Integer> miniHeap=new PriorityQueue<Integer>();
        for(int i:hand){
            miniHeap.offer(i);
        }

        while(!miniHeap.isEmpty()){
            int start=miniHeap.poll();
            for(int j=1;j<W;j++){
                if(miniHeap.remove(start+j)) continue;
                else return false;
            }
        }

        return  true;

    }
    public boolean isNStraightHand2(int[] hand, int W) {
        int len = hand.length;
        if (len % W != 0) return false;
        TreeMap<Integer, Integer> treeMap = new TreeMap<Integer, Integer>();
        for (int num : hand) {
            treeMap.put(num, treeMap.getOrDefault(num, 0) + 1);
        }
        while (!treeMap.isEmpty()) {
            int first = treeMap.firstKey();
            for (int j = 1; j < W; j++) {
                int next = first + j;
                if (treeMap.containsKey(next)) {
                    treeMap.put(next, treeMap.get(next) - 1);
                    if (treeMap.get(next) == 0) treeMap.remove(next);
                } else return false;
                treeMap.put(first, treeMap.get(first) - 1);
                if (treeMap.get(first) == 0) treeMap.remove(first);
            }

        }
        return true;
    }
}
