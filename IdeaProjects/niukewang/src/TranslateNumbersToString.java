public class TranslateNumbersToString {
    public static int getTranslationCount(int number){
        if(number<0) return 0;
        if(number==1) return 1;
        return helper(Integer.toString(number));
    }
    public static int helper(String number){
        int n=number.length();
        int[] dp=new int[n+1];
        dp[n]=0;
        dp[n-1]=1;
        for(int i=n-2;i>=0;i--){
            int g=0;
            if(Integer.parseInt(number.charAt(i)+""+number.charAt(i+1))<26) g=1;
            dp[i]=dp[i+1]+g*dp[i+2];
        }
        return dp[0];
    }
    public static void main(String[] args){
        System.out.println(getTranslationCount(-10));  //0
        System.out.println(getTranslationCount(1234));  //3
        System.out.println(getTranslationCount(12258)); //5
    }
}
