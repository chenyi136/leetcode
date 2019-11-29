public class CountNumber {

    private static volatile int num=1;
    private static Object lock=new Object();


    public static void main(String[] args) {


       Task task=new Task();


       Thread thread1=new Thread(task,"1");
       Thread thread2=new Thread(task,"2");

        thread1.start();
        thread2.start();
    }



    static class Task implements Runnable{
        @Override
        public void run() {
           while(true) {
               synchronized (lock) {
                   if(num>100){
                       System.out.println("打印完毕！");
                       lock.notify();
                       return;
                   }

                  else {
                       System.out.println(Thread.currentThread().getName() + ":"+num++);
                       lock.notify();

                       try {
                           lock.wait();
                       } catch (InterruptedException e) {
                           e.printStackTrace();
                       }
                   }
               }
           }
           }
    }
}



