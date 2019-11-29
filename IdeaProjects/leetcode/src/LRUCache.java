import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class LRUCache {
    Map<Integer,Integer> map=new HashMap<Integer,Integer>();
    int capacity;

    public LRUCache(int capacity) {

        this.capacity=capacity;
        map=new LinkedHashMap<Integer,Integer>(capacity+1);
    }

    public int get(int key) {
        Integer val= map.get(key);
        if(val==null) return -1;
        else{
            map.remove(key);
            map.put(key,val);
            return val.intValue();
        }
    }

    public void put(int key, int value) {
        map.remove(key);
        map.put(key,value);
        if(map.size()>capacity){
            map.remove(map.entrySet().iterator().next().getKey());
        }
    }

}
