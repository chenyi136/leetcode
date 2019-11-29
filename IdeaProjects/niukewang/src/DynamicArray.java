import java.util.Comparator;
import java.util.PriorityQueue;

public class  DynamicArray {
    int count=0;
    public PriorityQueue<Integer> minHeap=new PriorityQueue<Integer>(new Comparator<Integer>(){
        public int compare(Integer o1,Integer o2){
            return o1-o2;
        }
    });
    public PriorityQueue<Integer> maxHeap=new PriorityQueue<Integer>(new Comparator<Integer>(){
        public int compare(Integer o1,Integer o2){
            return o2-o1;
        }
    });
    public void Insert(Integer num) {
        count++;
        if(count%2==1){
            minHeap.offer(num);
            int i= minHeap.poll();
            maxHeap.offer(i);
        }else{
            maxHeap.offer(num);
            int i=maxHeap.poll();
            minHeap.offer(i);
        }
    }

    public Double GetMedian() {
        if(count%2==0)
            return (Double.valueOf(maxHeap.peek())+Double.valueOf(minHeap.peek()))/2;
        else
            return Double.valueOf(maxHeap.peek());
    }

}
