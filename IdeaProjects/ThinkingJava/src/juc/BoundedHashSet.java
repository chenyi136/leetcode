package juc;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.Semaphore;

/**
 * 使用信号量可以将任何一种容器变为有界容器
 * @param <T>
 */

public class BoundedHashSet<T> {
    private final Set<T> set;
    private final Semaphore sema;

    public BoundedHashSet(int boind) {
        this.set = Collections.synchronizedSet(new HashSet<>());
        sema=new Semaphore(boind);
    }

    public boolean add(T o) throws InterruptedException {
        sema.acquire();
        boolean wasAdded=false;
        try {
            wasAdded = set.add(o);
            return wasAdded;
        }finally {
            if(!wasAdded){
                sema.release();
            }
        }
    }

    public boolean remove(Object o){
        boolean wasRemoved =set.remove(o);
        if(wasRemoved) sema.release();

        return  wasRemoved;
    }
}
