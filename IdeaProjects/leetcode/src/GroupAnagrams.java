import java.util.*;

public class GroupAnagrams {
    public List<List<String>> groupAnagrams(String[] strs) {
        if(strs==null||strs.length==0) return null;
        Map<String,List<String>> result=new HashMap<String,List<String>>();
        for(String s:strs){
            char[] chars=s.toCharArray();
            Arrays.sort(chars);
            String str=String.valueOf(chars);
            if(!result.containsKey(str)){
                result.put(str,new ArrayList<String>());
            }
            result.get(str).add(s);
        }
        return new ArrayList<List<String>>(result.values());

    }
}
