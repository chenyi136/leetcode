package ProduceerAndConsumer;

import java.util.concurrent.BlockingDeque;
import java.util.concurrent.BlockingQueue;

/**
 * @ClassNameProducer
 * @Author jianwen
 * @Date 19-9-28 下午10:08
 * @Version V1.0
 */
public class Producer implements Runnable  {
    private final BlockingQueue sharedQueue;
    public Producer(BlockingQueue sharedQueue){
             this.sharedQueue = sharedQueue;
    }
    @Override
    public void run() {
        for(int i=0;i<10;i++){
            try{
                System.out.println("Producer:"+i);
                sharedQueue.put(i);
            }catch(InterruptedException ex){
                System.out.println("exception:"+ex);
            }
        }

    }
}
