package runtimeclasstype;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

class SimpleDynamicProxyHandle  implements InvocationHandler {
    private Object proxied;
    SimpleDynamicProxyHandle(Object proxied){
        this.proxied=proxied;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        System.out.println("***** proxy: "+proxy.getClass()+",method:"+method+",args:"+args);

        if(args!=null){
            for(Object arg:args){
                System.out.println(" "+arg);
            }
        }

        return method.invoke(proxied,args);
    }
}

public class SimpleDynamicProxy{
    public static  void consumer(Interface iface){
        iface.dosomething();
        iface.somethingElse("bonobo");
    }

    public static void main(String[] args) {
        RealObject real=new RealObject();
        consumer(real);

//new Class[]{Interface.class} 等价于　Interface.getclass().getInterfaces();
        Interface proxy= (Interface) Proxy.newProxyInstance(Interface.class.getClassLoader(),new Class[]{ Interface.class},new SimpleDynamicProxyHandle(real));
        consumer(proxy) ;
    }
}