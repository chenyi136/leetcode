public class ReverseSentence {
    public static String reverse(String s){
        if (s==null||s.length()==0) {
            return s;
        }
        char[] seq=s.toCharArray();
        int length=seq.length;

        // 反转这个数组
        helper(seq, 0, length - 1);


        int start=0,end=0;
//        for(int i=start;i<=s.length();i++){
//            if(s.charAt(i)==' '||i==s.length()){
//                end=i;
//                helper(s,start,end-1);
//                start=end+1;
//            }
//
//        }
        while(end<=s.length()){
            if(end==s.length()||s.charAt(end)==' '){
                helper(seq,start,end-1);
                start=end+1;
            }
            end++;
        }
        return s;

    }
    public  static void helper(char[] seq,int start,int end){

        while(start<end){
            char temp=seq[start];
            seq[start]=seq[end];
            seq[end]=seq[start];
            start++;end--;
        }

    }
}
