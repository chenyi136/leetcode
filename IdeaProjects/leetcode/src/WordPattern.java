import java.util.HashMap;
import java.util.Map;

public class WordPattern {
    public static boolean wordPattern(String pattern, String str) {

        Map<Character,String> map=new HashMap<Character,String>();

        String[] strs=str.split(" ");
        if(pattern.length()!=strs.length) return false;
        for(int i=0;i<pattern.length();i++){
            char ch=pattern.charAt(i);
            String s=strs[i];
            if(map.containsKey(ch)){
                if(map.get(ch).equals(s))
                    continue;
                else return false;
            }else if(!map.containsValue(s)) map.put(ch,s);
            else return false;

        }
        return true;

    }

    public static void main(String[] args) {
        System.out.println(wordPattern("abba","dog cat cat dog"));
    }
}
