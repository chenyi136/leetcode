package com.company.objectshare;

public class MutableInteger {
    /**
     * 非线程安全的可变整数类，get和set 方法都是在没有同步的情况下访问value,容易产生失效数据
     * eg:如果某个线程调用了set,那么另一个线程正在调用get可能会看到更新后的数据，也可能看不到
     * 如果对俩方法家sychronized 关键字可实现同步
     */
    private int value;
    private int get(){return  value;}
    public void set(int value){
        this.value=value;
    }
}
