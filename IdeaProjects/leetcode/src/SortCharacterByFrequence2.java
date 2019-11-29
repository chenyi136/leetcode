import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class SortCharacterByFrequence2 {
    public String frequencySort(String s) {
        HashMap<Character, Integer> map = new HashMap<Character, Integer>();
        char[] chars = s.toCharArray();
        for (char c : chars) {
            map.put(c, map.getOrDefault(c, 0) + 1);

        }
        List<Character>[] frequences=new List[s.length()+1];
        for(char c : map.keySet()){
            int frequence=map.get(c);
            if(frequences[frequence]==null) frequences[frequence]=new ArrayList<Character>();
            frequences[frequence].add(c);
        }
        StringBuilder sb = new StringBuilder();

        for(int pos=frequences.length-1;pos>=0;pos--){
            if(frequences[pos]!=null) {
                for (char c : frequences[pos]) {
                    while (map.get(c) > 0) {
                        sb.append(c);
                        pos--;
                    }
                }
            }

        }
        return sb.toString();
    }
}
