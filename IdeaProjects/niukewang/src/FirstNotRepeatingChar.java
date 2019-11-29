import java.util.HashMap;

/**
 * @ClassNameFirstNotRepeatingChar
 * @Author jianwen
 * @Date 19-9-3 下午5:35
 * @Version V1.0
 */
public class FirstNotRepeatingChar {
    public int firstNotRepeatingChar(String str) {
        HashMap<Character,Integer> map=new HashMap<>();
        char[] chars=str.toCharArray();
        for(char ch:chars){
            map.put(ch,map.getOrDefault(ch,0)+1);
        }
        for(int i=0;i<chars.length;i++){
            if(map.get(chars[i])==1) return i;
        }
        return -1;
    }
}
