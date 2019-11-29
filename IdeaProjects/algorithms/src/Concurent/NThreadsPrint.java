package Concurent;

/**
 * @ClassNameNThreadsPrint
 * @Author jianwen
 * @Date 19-7-8 下午4:55
 * @Version V1.0
 */
public class NThreadsPrint implements Runnable{
    private static final Object LOCK = new Object();
    /**
     * 当前即将打印的数字
     */
    private static int current = 0;
    /**
     * 当前线程编号，从0开始
     */
    private int threadNo;
    /**
     * 线程数量
     */
    private int threadCount;
    /**
     * 打印的最大数值
     */
    private int maxInt;

    public NThreadsPrint(int threadNo, int threadCount, int maxInt) {
        this.threadNo = threadNo;
        this.threadCount = threadCount;
        this.maxInt = maxInt;
    }

    @Override
    public void run() {
        while(true){
            synchronized (LOCK){
//                判断是否轮到当前线程执行
                while(current%threadCount!=threadNo) {
                    if (current > maxInt) break;
                    try {
                        LOCK.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
                // 最大值跳出循环
                if (current > maxInt) {
                    break;
                }
                System.out.println("thread" + threadNo + " : " + current);
                current++;
                // 唤醒其他wait线程
                LOCK.notifyAll();

            }
        }
    }

    public static void main(String[] args) {
        int threadCount=3;
        int max=100;
//        long start=System.currentTimeMillis();
        for(int i=0;i<threadCount;i++){
            new Thread(new NThreadsPrint(i,threadCount,max)).start();
        }
//        long end=System.currentTimeMillis();
//        System.out.println(end-start);
    }
}
/**
 * 这个老司机的代码的确能跑通，但是有一个问题是什么呢？
 * 当我们线程数很大的时候，由于我们不确定唤醒的线程到底是否是下一个要执行的就有可能会出现抢到了锁但不该自己执行，
 * 然后又进入wait的情况，比如现在有100个线程，现在是第一个线程在执行，他执行完之后需要第二个线程执行，
 * 但是第100个线程抢到了，发现不是自己然后又进入wait，然后第99个线程抢到了，发现不是自己然后又进入wait，
 * 然后第98,97...直到第3个线程都抢到了，最后才到第二个线程抢到同步锁，这里就会白白的多执行很多过程，
 * 虽然最后能完成目标。
 *
 *
 *
 */
