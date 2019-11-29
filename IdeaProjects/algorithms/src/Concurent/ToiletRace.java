package Concurent;

import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

/**
 * @ClassName ToiletRace
 * @Author jianwen
 * @Date 19-7-8 下午4:41
 * @Version V1.0
 */
 class Employee implements Runnable{

    private String id;
//    runnable 任务中设置semaphre 控制操作数量
    private Semaphore semaphore;
    private static Random rand= new Random(47);

    public Employee(String id, Semaphore semaphore) {
        this.id = id;
        this.semaphore = semaphore;
    }

    @Override
    public void run() {
        try {
            semaphore.acquire();
            System.out.println(this.id + "is using the toilet");
            TimeUnit.MILLISECONDS.sleep(rand.nextInt(2000));
            semaphore.release();
            System.out.println(this.id + "is leaving");
        } catch (InterruptedException e) {

        }
    }


}
public class ToiletRace{
    private static final int THREAD_COUNT = 30;

    private static ExecutorService threadPool = Executors
            .newFixedThreadPool(THREAD_COUNT);

    private static Semaphore s = new Semaphore(10);

    public static void main(String[] args) {
        for (int i = 0; i < THREAD_COUNT; i++) {
            threadPool.execute(new Employee(String.valueOf(i), s));
        }

        threadPool.shutdown();
    }


}
