package com.company.objectshare;

public class NoVisibility {
    private static boolean ready;
    private static int number;


    /**　在没有同步情况下的数据共享，非线程安全
        数据在多个线程之间共享
     */
    private static class ReaderThread extends Thread{
        public void run(){
//            yield()的作用是让步。它能让当前线程由“运行状态”进入到“就绪状态”，从而让其它具有相同优先级的等待线程获取执行权；但是，并不能保
//            证在当前线程调用yield()之后，其它具有相同优先级的线程就一定能获得执行权；也有可能是当前线程又进入到“运行状态”继续运行！
            while(!ready) Thread.yield();//

            System.out.println(number);
        }

    }
    public static void main(String[] args) {
        new ReaderThread().start();
        number=42;
        ready=true;
    }
}
