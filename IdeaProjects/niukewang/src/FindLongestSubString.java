public class FindLongestSubString {
    public static int longestSubString(String str){
        if(str==null || str.length()<=0)
            return 0;
        int preLength=0;  //即f(i-1)
        int curLength=0;  //即f(i)
        int maxLength=0;
        int[] pos= new int[26];  //用于存放字母上次出现的位置
        for(int i=0;i<pos.length;i++)
            pos[i]=-1;
        for(int i=0;i<str.length();i++) {
            int letterNumber = str.charAt(i)-'a';
            if(pos[letterNumber]<0 || i-pos[letterNumber]>preLength) {
                curLength=preLength+1;
            }else {
                curLength=i-pos[letterNumber];
            }
            pos[letterNumber]=i;
            if(curLength>maxLength)
                maxLength=curLength;
            preLength=curLength;
        }
        return maxLength;


    }
    public static void main(String[] args) {
        System.out.println(longestSubString("arabcacfr"));
        System.out.println(longestSubString("a"));
        System.out.println(longestSubString("aaa"));
        System.out.println(longestSubString("abcdef"));
        System.out.println(longestSubString(""));
        System.out.println(longestSubString(null));
    }
}
