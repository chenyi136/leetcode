import java.util.concurrent.Semaphore;

public class Semaphore_ABC{
    private static Semaphore A =new Semaphore(1);
    private static Semaphore B=new Semaphore(0);
    private static Semaphore C=new Semaphore(0);

    static class ThreadA extends Thread{
        public void run(){

                try {
                    for(int i=0;i<10;i++) {
                        A.acquire();
                        System.out.println("线程１打印: "+"A");
                        B.release();
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }

    static class ThreadB extends Thread {
        @Override
        public void run() {
            try {
                for (int i = 0; i < 10; i++) {
                    B.acquire();
                    System.out.println("线程2打印： " + "B");
                    C.release();
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    static class ThreadC extends Thread {
        @Override
        public void run() {
            try {
                for (int i = 0; i < 10; i++) {
                    C.acquire();
                    System.out.println("线程3打印： " + "C");
                    A.release();
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }


    public static void main(String[] args) throws InterruptedException {
        new ThreadA().start();
        new ThreadB().start();
        new ThreadC().start();
    }




}
