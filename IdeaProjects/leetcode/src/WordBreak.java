import java.sql.SQLOutput;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class WordBreak {

    public static boolean wordBreak(String s, Set<String> wordDict) {
        int len = s.length();
        boolean[] f = new boolean[len+1];
        f[0] = true;
        for (int i=1; i<len+1; i++)
            for (int j=0; j<i; j++)
                if (f[j] && wordDict.contains(s.substring(j,i)))
                {
                    f[i] = true;
                    break;
                }
        return f[len];
    }



    public static void main(String[] args) {
        String str="catsandog";
        String[] strArray= new String[]{"cats","dog","sand","and","cat"};

        Set<String> staffsSet = new HashSet<>(Arrays.asList(strArray));
        System.out.println(wordBreak(str,staffsSet));
    }
}