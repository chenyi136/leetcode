package juc;

import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Level;
import java.util.logging.Logger;

public class myAppThread extends Thread {
    private static final String DEFAULT_NAME="MyAppThread";
    private static volatile boolean debugLifecyle=false;
    private static final AtomicInteger created=new AtomicInteger();
    private static final AtomicInteger alive=new AtomicInteger();
    private static final Logger log=Logger.getAnonymousLogger();

    public myAppThread(Runnable r){
        this(r,DEFAULT_NAME);
    }

    public myAppThread(Runnable runnable,String name){
        super(runnable,name+" "+created.incrementAndGet());

    }
    public void run(){
        boolean debug=debugLifecyle;
        if(debug) log.log(Level.FINE,"Created"+getName());
    }

}
