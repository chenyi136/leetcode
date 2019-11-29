package DFS;
import java.util.ArrayList;
import java.util.List;
import java.util.Collections;
import java.util.ArrayList;

/**
 * @ClassNamePermutation
 * @Author jianwen
 * @Date 19-9-3 下午2:52
 * @Version V1.0
 */
public class Permutation {



        public ArrayList<String> Permutation(String str) {
            if(str==null||str.length()==0) return null;
            ArrayList<String> result=new ArrayList<>();

            PermutationHelper(result,str.toCharArray(),0);
            Collections.sort(result);
            return result;
        }

    public void PermutationHelper(List<String> list,char[] cs, int index) {
        if (index == cs.length - 1) {
            String val = String.valueOf(cs);
            if (!list.contains(val))
                list.add(val);
        } else {
            for (int j = index; j < cs.length; j++) {
                swap(cs, index, j);
                PermutationHelper(list,cs,index+1);
                swap(cs, index, j);
            }
        }
    }

    public void swap(char[] cs, int i, int j) {
        char temp = cs[i];
        cs[i] = cs[j];
        cs[j] = temp;
    }

}

