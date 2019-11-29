package com.example.demo.aop;

import org.springframework.stereotype.Component;

@Component
public class Chinese implements Person {


    @Override
    public String sayHello(String name) {
        System.out.println("-- sayHello() --");
        return name + " hello, AOP";
    }



    public void eat(String food) {
        System.out.println("我正在吃：" + food);
    }
}
