package DesignModel;

/**
 * @ClassNameSingleTon1
 * @Author jianwen
 * @Date 19-11-18 下午7:32
 * @Version V1.0
 */
public class Singleton1 {
    //静态实例变量
    private volatile static Singleton1 instance=null;
    // 私有化的构造方法
    private Singleton1(){

    }
    public static Singleton1 getInstance(){
        //先检查实例是否存在，如果不存在才进入下面的同步块
        if(instance==null){
            synchronized (Singleton1.class){
                if(instance==null){
                    instance=new Singleton1();
                }
            }
        }
        return instance;
    }

}
