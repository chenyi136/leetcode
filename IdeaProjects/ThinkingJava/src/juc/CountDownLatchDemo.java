package juc;


import java.util.Random;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

class TaskPortion implements Runnable{
    private static int counter=0;
    private final int id=counter++;
    private static Random rand=new Random(47);
    private final CountDownLatch latch;

    TaskPortion(CountDownLatch latch) {
        this.latch = latch;
    }

    @Override
    public void run() {
        try {
            dowork();
            latch.countDown();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }

    public void dowork() throws InterruptedException {
        TimeUnit.MICROSECONDS.sleep(rand.nextInt(2000));
        System.out.println("this completed");
    }

}

class WatingTask implements Runnable{
    private static int counter=0;
    private final int id=counter++;

    private final CountDownLatch latch;

    WatingTask(CountDownLatch latch) {
        this.latch = latch;
    }

    @Override
    public void run() {
        try {
            latch.await();
            System.out.println("Latch barrier passed for "+this);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String toString() {
        return String.format("WatingTask %1$-3d",id);
    }
}
public class CountDownLatchDemo  {
    static final  int SIZE=20;

    public static void main(String[] args) {
        ExecutorService exec=Executors.newCachedThreadPool();
        CountDownLatch latch=new CountDownLatch(SIZE);
        for(int i=0;i<10;i++){
            exec.execute(new WatingTask(latch));
        }
        for(int j=0;j<SIZE;j++){
            exec.execute(new TaskPortion(latch));
        }
        System.out.println("Lauched all task");
        exec.shutdown();
    }
}
