package com.company.CountDownLatch;

import java.util.Random;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class Taskportion implements Runnable{
    private static int counter=0;
    private final int id=counter++;
    private static Random rand=new Random(47);
    private final CountDownLatch latch;

    public Taskportion(CountDownLatch latch) {
        this.latch=latch;
    }

    @Override
    public void run() {
        try {
            doWork();
            latch.countDown();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

    }
    public void doWork() throws InterruptedException {
        TimeUnit.MICROSECONDS.sleep(rand.nextInt(2000));
        System.out.println(this+"completd");
    }

    public String toString(){
        return String.format("%1$-3d ",id);

    }
}
