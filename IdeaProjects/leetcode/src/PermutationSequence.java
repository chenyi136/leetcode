import java.util.ArrayList;
import java.util.List;

public class PermutationSequence {
    public String getPermutation(int n, int k) {

        List<Integer> number=new ArrayList<Integer>();
        StringBuilder sb=new StringBuilder();
        int[] factors=new int[n+1];
        factors[0]=1;
        int sum=1;
        for(int i=1;i<=n;i++){
            sum*=i;
            factors[i]=sum;
        }

        for(int i=1;i<=n;i++){
            number.add(i);
        }

        k=k-1;
        for(int i=1;i<=n;i++) {
            int index = k / factors[n - i];

            sb.append(String.valueOf(number.get(index)));
            number.remove(index);
            k = k % factors[n - i];

        }
        return sb.toString();


    }
}
