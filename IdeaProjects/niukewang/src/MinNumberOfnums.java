import java.util.Arrays;
import java.util.Comparator;

public class MinNumberOfnums {
    public static String minNumber(int[] nums){
        if(nums==null||nums.length==0) return null;

        int size=nums.length;

        String[] str=new String[size];
        StringBuilder sb=new StringBuilder();

        for(int i=0;i<size;i++){
            str[i]=String.valueOf(nums[i]);
        }

        Arrays.sort(str, new Comparator<String>() {
            @Override
            public int compare(String o1, String o2) {
                String c1=o1+o2;
                String c2=o2+o1;
                return c1.compareTo(c2);
            }
        });

        for(String s:str) sb.append(s);

        return sb.toString();

    }

    public static void main(String[] args) {
        int a[] = {3, 32, 321};
        System.out.println(minNumber(a));

    }
}
