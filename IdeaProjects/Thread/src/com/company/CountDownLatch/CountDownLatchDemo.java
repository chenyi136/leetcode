package com.company.CountDownLatch;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class CountDownLatchDemo {
    static final int SIZE=100;

    public static void main(String[] args) {
        ExecutorService exec= Executors.newCachedThreadPool();
        CountDownLatch latch=new CountDownLatch(SIZE);
        for(int i=0;i<10;i++){
            exec.execute(new WatingTask(latch));
        }
        for(int j=0;j<SIZE;j++){
            exec.execute(new Taskportion(latch));
        }
        System.out.println("Lauched all tasks");
        exec.shutdown();
    }
}
