/**
 * @ClassNameLongestPalindrome409
 * @Author jianwen
 * @Date 19-9-25 上午12:42
 * @Version V1.0
 */
public class LongestPalindrome409 {
    public static void main(String[] args) {
        System.out.println(longestPalindrome("bb"));
    }
    public static int longestPalindrome(String s) {
        if(s==null||s.length()==0) return 0;
        int[] count=new int[26];
        for(char ch:s.toCharArray()){
            count[ch-'a']++;
        }
        int res=0;
        int k=0;
        for(int temp:count){
            if(temp%2==0) {res+=temp;k++;}
            else res+=temp-1;
        }
        return k*2==s.length()?res:res+1;
    }
}
