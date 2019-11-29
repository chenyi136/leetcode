package Concurent;

import java.util.concurrent.Semaphore;

/**
 * @ClassNameNThreadsPrint2
 * @Author jianwen
 * @Date 19-7-8 下午5:11
 * @Version V1.0
 */

public class NThreadsPrint2 {
    static int result = 0;

    public static void main(String[] args) throws InterruptedException {
        int N=3;
        Thread[] threads=new Thread[N];
        final Semaphore[] syncObjects=new Semaphore[N];
        for(int i=0;i<N;i++){
            syncObjects[i]=new Semaphore(1);
            if (i != N-1){
                syncObjects[i].acquire();
            }
        }
        for(int i=0;i<N;i++){
            final Semaphore lastSemphore=(i==0?syncObjects[N-1]:syncObjects[i-1]);
            final Semaphore curSemphore = syncObjects[i];
            final int index = i;
            threads[i] = new Thread(new Runnable() {
                @Override  public void run() {
                    try {
                        while (true) {
                            lastSemphore.acquire();
                            System.out.println("thread" + index + ": " + result++);
                            if (result > 100) {
                                System.exit(0);
                            }
                            curSemphore.release();
                        }
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }


                }

            });
            threads[i].start();

        }

    }

}
