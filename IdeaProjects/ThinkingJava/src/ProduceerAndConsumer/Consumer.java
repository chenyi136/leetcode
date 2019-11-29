package ProduceerAndConsumer;

import java.util.concurrent.BlockingQueue;

/**
 * @ClassNameConsumer
 * @Author jianwen
 * @Date 19-9-28 下午10:13
 * @Version V1.0
 */
public class Consumer implements Runnable {
    private final BlockingQueue sharedQueue;
    public Consumer(BlockingQueue sharedQueue){
        this.sharedQueue=sharedQueue;

    }

    @Override
    public void run() {
       while(true){
           try {
               System.out.println("comsumed"+sharedQueue.take());
           } catch (InterruptedException e) {
               e.printStackTrace();
           }
       }
    }
}
