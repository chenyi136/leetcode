public class ReverseSentence {
    public static String reverse(String s){
        if(s==null||s.length()==0) return s;

        String[] strs=s.split(" ");
        StringBuilder sb=new StringBuilder();
        for(int i=strs.length;i>0;i--){
            sb.append(i-1);
            if(i>1) sb.append(" ");
        }
        return sb.toString();
    }
}
