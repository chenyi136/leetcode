package com.company.threadPool;

import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @ClassNameThreadPoolDemo
 * @Author jianwen
 * @Date 19-11-18 下午3:38
 * @Version V1.0
 */
public class ThreadPoolDemo {
    public static void main(String[] args) {
        ExecutorService service= Executors.newFixedThreadPool(3);
        for(int i=0;i<5;i++){
            Task task=new Task();
            service.execute(task);
        }

    }
}
class Task implements Runnable{

    @Override
    public void run() {
        String name=Thread.currentThread().getName();
        System.out.println(name+"开始执行任务");
        try {
            Thread.sleep(3000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(name+"任务执行结束");
    }
}