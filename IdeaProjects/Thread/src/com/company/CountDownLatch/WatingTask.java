package com.company.CountDownLatch;

import java.sql.SQLOutput;
import java.util.concurrent.CountDownLatch;

public class WatingTask implements Runnable {
    private static int counter=0;
    private final int id=counter++;
    private CountDownLatch latch;
    WatingTask(CountDownLatch latch){
        this.latch=latch;
    }
    @Override
    public void run() {
        try {
            latch.await();
            System.out.println("Latch  barrier passed for "+this);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public String toString(){
        return String.format("%1$-3d ",id);
    }
}
