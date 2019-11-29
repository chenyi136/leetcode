package ProduceerAndConsumer;

/**
 * @ClassNameStorage
 * @Author jianwen
 * @Date 19-9-29 上午12:03
 * @Version V1.0
 */

/**
 * 仓库类，有可装库存的最大数量max
 */
public class Storage {
    private static int productCount=0;
    private static final int Max=20;// ｚ最多可存数量

    public synchronized void addProduct(){
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        if(productCount==Max){//如果商品数量达到上限就停止生产
            try {
                System.out.printf("现在有%d个商品，消费者进入阻塞状态。\n",productCount);
                this.wait();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }else{

            System.out.printf("现在有%d个商品，消费一个后剩下%d个商品。\n",productCount,productCount-1);
            productCount++;
        }
        notifyAll();
    }

    public synchronized void consumeProduct(){
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        if(productCount==0){
            System.out.printf("现在有%d个商品，消费者进入阻塞状态。\n",productCount);
            try{
                this.wait();
            }catch (Exception e){
                e.printStackTrace();
            }
        }else{

            System.out.printf("现在有%d个商品，消费一个后剩下%d个商品。\n",productCount,productCount-1);


        }
    }


}

class Productor implements Runnable{

    private Storage product;
    public Productor(Storage product){
        this.product=product;
    }
    public void run(){
        while(true){
            product.addProduct();
        }
    }
}

class Consumerl implements Runnable{
    private Storage consumer;
    public Consumerl(Storage consumer){
        this.consumer=consumer;
    }

    public void run(){
        while(true) {
            consumer.consumeProduct();
        }
    }
}

class TestProductConsume{
    public static void main(String[] args){
        Storage obj = new Storage();
        Productor productor = new Productor(obj);
        Consumerl consumer=new Consumerl(obj);

        Thread productThread = new Thread(productor);//创建生产者进程
        Thread consumeThread = new Thread(consumer);//创建消费者进程
        productThread.start();
        consumeThread.start();
    }
}
