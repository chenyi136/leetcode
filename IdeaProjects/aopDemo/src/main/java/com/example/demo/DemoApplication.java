package com.example.demo;

import com.example.demo.aop.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
public class DemoApplication {

    //这里必须使用Person接口做注入
    @Autowired
    private Person chinese;

   @Bean
   public CommandLineRunner commandLineRunner(ApplicationContext ctx) {
       return args -> {
           // spring aop
           System.out.println("******** spring aop ******** ");
            chinese.sayHello("zhang");
            chinese.eat("apple");
           System.exit(0);
       };
   }



    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

}
