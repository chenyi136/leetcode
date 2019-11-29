import java.util.*;

public class MaximumGap {
    public static int maximumGap(int[] nums) {
        if(nums.length<2){
            return 0;
        }
        Arrays.sort(nums);

        if(nums.length==2) return nums[1]-nums[0];
        Map<Integer,Integer> gap=new HashMap<>();
        for(int i=1;i<nums.length;i++){
            gap.put(nums[i]-nums[i-1],gap.getOrDefault(nums[i]-nums[i-1],0)+1);

        }
        System.out.println(gap.get(3));
        List<Map.Entry<Integer,Integer>>list=new ArrayList<Map.Entry<Integer, Integer>>(gap.entrySet());
        Collections.sort(list, new Comparator<Map.Entry<Integer, Integer>>() {
            @Override
            public int compare(Map.Entry<Integer, Integer> o1, Map.Entry<Integer, Integer> o2) {
                return (o2.getValue()-o1.getValue());
            }
        });
        return list.get(0).getKey();

    }

    public static void main(String[] args) {
        System.out.println(maximumGap(new int[]{1,10000}));
    }

}
