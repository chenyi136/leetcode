import java.util.ArrayList;
import java.util.Deque;
import java.util.LinkedList;

public class MaxInWindows {
    public static ArrayList<Integer> maxInWindows(int num[],int size){
        ArrayList<Integer> res=new ArrayList<>();
        if(num==null||num.length==0||size==0||size>num.length){
            return  res;
        }
        Deque<Integer> deque=new LinkedList<>();

        //窗口未被填满时找到最大值的索引
       for(int i=0;i<size&&i<num.length;i++){
           while(!deque.isEmpty()&&num[i]>=num[deque.getLast()]){
               deque.removeLast();
           }
           deque.addLast(i);
       }

       //窗口填满时
        for(int i=size;i<num.length;i++){
           res.add(num[deque.getFirst()]);
            while(!deque.isEmpty()&&num[i]>=num[deque.getLast()]){
                deque.removeLast();
            }
            //删除已经滑出窗口的最大值
            if(!deque.isEmpty()&&deque.getFirst()<=(i-size)){
                deque.removeFirst();
            }
            deque.addLast(i);
        }

        res.add(num[deque.getFirst()]);

       return  res;

    }



}
