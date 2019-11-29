import java.util.ArrayList;
import java.util.List;

public class Stringpermutation {
    public List<String> StrPermutation(String s) {
        List<String> result = new ArrayList<>();
        if(s==null) return null;
        char[] chars=s.toCharArray();
        permutatin(result,chars,0);
        return result;
    }

    private void permutatin(List<String> result, char[] chars, int index) {

        if(index==chars.length){
            result.add(chars.toString());
        }
        for(int i=index;i<chars.length;i++){
                swap(chars[index],chars[i]);
                permutatin(result,chars,index+1);
                swap(chars[index],chars[i]);


        }
    }
    private void swap(char a,char b){
        char temp=a;
        a=b;
        b=temp;
    }
}
