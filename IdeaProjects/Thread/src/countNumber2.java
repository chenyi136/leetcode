import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class countNumber2 {
    private static ReentrantLock lock =new ReentrantLock();
    private Condition a=lock.newCondition();
    private Condition b=lock.newCondition();
    static volatile  int num=1;
    private void print(){
        new Thread(){
            public void run(){
                while(num<100){
                    lock.lock();
                    System.out.println("线程１打印"+num++);
                    try {
                        a.await();
                        b.signal();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }finally {
                        lock.unlock();
                    }

                }
            }

        }.start();

        new Thread(){
            public void run(){
                while(num<100){
                    lock.lock();
                    System.out.println("线程２打印"+num++);


                    try {
                        a.signal();
                        b.await();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }finally {
                        lock.unlock();
                    }
                }
            }

        }.start();
//        a.signal();
//        b.signal();
    }

    public static void main(String[] args) {
        new countNumber2().print();
    }
}
