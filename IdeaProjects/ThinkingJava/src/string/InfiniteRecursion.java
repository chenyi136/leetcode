package string;

import java.util.ArrayList;
import java.util.List;

public class InfiniteRecursion {
    public String toString(){

//        当运行该行代码时，发生了自动类型转换，由infiniteRecursion 类型转换为String 类型，
//        而Recursion 类型转换为String 类型是Recursion会调用toString方法，所以此处产生了无限递归
//        此处如果想打印对象地址，可以调用super.toString()
//        return "infiniteRecursion"+this+"\n";
        return "infiniteRecursion"+super.toString()+"\n";
    }

    public static void main(String[] args) {
        List<InfiniteRecursion> v=new ArrayList<>();
        for(int i=0;i<10;i++){
            v.add(new InfiniteRecursion());
        }
        System.out.println(v);
    }

}
