package DesignModel;

/**
 * @ClassNameSingleTon2
 * @Author jianwen
 * @Date 19-11-18 下午8:29
 * @Version V1.0
 */
public class SingleTon2 {
    private static class SingletonHolder{
        private static SingleTon2 instance=new SingleTon2();
    }
    private SingleTon2(){}
    public static SingleTon2 getInstance(){
        return SingletonHolder.instance;
    }

}
