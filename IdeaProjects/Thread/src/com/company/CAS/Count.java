package com.company.CAS;


import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;
import java.util.concurrent.atomic.AtomicInteger;

public class Count {
   private AtomicInteger counter=new AtomicInteger(0);

   public int getValue(){
       return counter.get();
   }

   public void increase(){
       int v;
       do{
           v=counter.get();
       }while(!counter.compareAndSet(v,v+1));
   }
}
