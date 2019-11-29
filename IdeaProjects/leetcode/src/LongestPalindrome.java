/**
 * @ClassNameLongestPalindrome
 * @Author jianwen
 * @Date 19-7-8 下午6:52
 * @Version V1.0
 */
public class LongestPalindrome {

    String longestPalindrome(String s){
        final int len=s.length();
        boolean[][] dp=new boolean[len][len];

        int start=0,end=0;
        for(int i=0;i<len;i++){
            for(int j=0;j<=i;j++){
                if(i-j<2){
                    dp[j][i]=(s.charAt(i)==s.charAt(j));
                }
                else{
                    dp[j][i]=(s.charAt(i) == s.charAt(j) && dp[j + 1][i - 1]);
                }
                if(dp[j][i] && end-start+1 < i - j + 1)
                {
                    end=i;start=j;
                }
            }
        }
        return s.substring(start,end);
    }
}
