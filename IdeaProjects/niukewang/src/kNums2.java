import java.util.ArrayList;
import java.util.Comparator;
import java.util.PriorityQueue;

public class kNums2 {

    public static void main(String[] args) {
        int[] input={4,5,1,6,2,7,3,8};
        System.out.println(GetLeastNumbers_Solution(input,4));
    }
    public static  ArrayList<Integer> GetLeastNumbers_Solution(int [] input, int k){
        ArrayList<Integer> result=new ArrayList<Integer>();
        if(input==null||input.length==0||k<0||k>input.length) return result;
       PriorityQueue<Integer> queue=new PriorityQueue<Integer>(k, new Comparator<Integer>() {
           @Override
           public int compare(Integer o1, Integer o2) {
               return o2-o1;
           }
       });


        for(int i=0;i<k;i++){
            queue.offer(input[i]);

        }
        for(int i=k;i<input.length;i++){
           int maxnum=queue.peek();
           if(maxnum>input[i]){
               queue.poll();
               queue.offer(input[i]);
           }
        }
        while(!queue.isEmpty()){

            int temp=queue.poll();
            result.add(0,temp);

        }
        return result;
    }
}
