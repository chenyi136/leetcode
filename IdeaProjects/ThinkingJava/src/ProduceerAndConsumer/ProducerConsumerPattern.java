package ProduceerAndConsumer;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingDeque;

/**
 * @ClassNameProducerConsumerPattern
 * @Author jianwen
 * @Date 19-9-28 下午10:17
 * @Version V1.0
 */
public class ProducerConsumerPattern {
    public static void main(String[] args) {
        BlockingQueue sharedQueue=new LinkedBlockingDeque();
        Thread prodThread=new Thread(new Producer(sharedQueue));
        Thread consThread=new Thread(new Consumer(sharedQueue));

        prodThread.start();
        consThread.start();
    }
}
