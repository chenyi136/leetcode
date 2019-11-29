import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class leet448 {
    public List<Integer> findDisappearedNumbers(int[] nums) {
        if(nums==null||nums.length==0) return null;
        List<Integer> list=new ArrayList<Integer>();
        HashMap<Integer,Integer> map=new HashMap<Integer,Integer>();
        for(int i:nums) map.put(i,map.getOrDefault(i,0)+1);
        for(int i=1;i<=nums.length;i++){
            if(!map.keySet().contains(i)) list.add(i);
        }
        return list;
    }
}
