import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class IsomorphicString {

    public boolean isIsomorphic(String s, String t) {
        Map<Character,Character> chars=new HashMap<Character,Character>();
        if(s.length()==0||s==null){
            return false;
        }
        for(int i=0;i<s.length();i++){
            char a=s.charAt(i);
            char b=t.charAt(i);
            if(chars.containsKey(a)){
                if(chars.get(a).equals(b)) continue;
                else return false;
            }else{
                if(!chars.containsValue(b)) chars.put(a,b);
                else return false;
            }
        }
        return true;

    }

}
