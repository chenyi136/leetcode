import java.util.HashMap;

public class LongestSubString {
    public int lengthOfLongestSubstring(String s) {
        if(s==null||s.length()==0) return 0;
        int left=-1,right=0;
        int max=0;
        HashMap<Character,Integer> lastLocation=new HashMap<>();
        for(;right<s.length();right++){
            char c=s.charAt(right);

            if(lastLocation.containsKey(c)&&lastLocation.get(c)>left)
                left=lastLocation.get(c);
            max=Math.max(right-left,max);
            lastLocation.put(c,right);



        }

        return max;
}
}
