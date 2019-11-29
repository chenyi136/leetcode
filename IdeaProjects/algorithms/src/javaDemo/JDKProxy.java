package javaDemo;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

public class JDKProxy implements InvocationHandler {

    private Object targetObject;//需要代理的对象


    public Object newProxy(Object targetObject){
        this.targetObject=targetObject;

        return Proxy.newProxyInstance(targetObject.getClass().getClassLoader(),targetObject.getClass().getInterfaces(),this);
    }
    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        before();
        Object ret=null;
        ret=method.invoke(targetObject,args);
        after();
        return ret;
    }
    private void before() {//方法执行前
        System.out.println("方法执行前 !");
    }
    private void after() {//方法执行后
        System.out.println("方法执行后");
    }
}
