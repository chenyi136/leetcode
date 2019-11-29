import java.util.ArrayList;
import java.util.HashMap;

public class FindNumbersWithSum {
    public ArrayList<Integer> FindNumbers(int [] array, int sum) {
        ArrayList<Integer> res = new ArrayList<Integer>();
        if(array==null||array.length < 2)
            return res;
        int less=Integer.MAX_VALUE;
        HashMap<Integer,Integer> map=new HashMap<Integer,Integer>();
        for(int i=0;i<array.length;i++){
            if(map.containsKey(array[i])){
                if( array[i]*map.get(array[i])<less)
                    res.clear();
                res.add(array[i]);
                res.add(map.get(array[i]));

            }else{
                map.put(sum-array[i],array[i]);
            }
        }
        return res;

    }
}
