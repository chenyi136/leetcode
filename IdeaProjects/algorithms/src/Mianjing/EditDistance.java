package Mianjing;

public class EditDistance {
    public int minDistance(String word1,String word2){
        int len1=word1.length(),len2=word2.length();
        int[][] p=new int[len1+1][len2+1];
        for(int i=0;i<len1+1;i++){
            p[i][0]=i;
        }
        for(int i=0;i<len2+1;i++){
            p[0][i]=i;
        }
        for(int i=1;i<len1+1;i++){
            for(int j=1;j<len2+1;j++){
                if(word1.charAt(i-1)==word2.charAt(j-1))
                    p[i][j]=p[i-1][j-1];
                else{
                    p[i][j]=Math.min(p[i-1][j-1],Math.min(p[i-1][j],p[i][j-1]))+1;
                }
            }
        }
        return p[len1][len2];
    }
}
