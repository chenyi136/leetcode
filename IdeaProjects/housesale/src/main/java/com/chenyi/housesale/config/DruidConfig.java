package com.chenyi.housesale.config;

import com.alibaba.druid.filter.Filter;
import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.pool.DruidDataSource;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DruidConfig {

    @ConfigurationProperties(prefix = "spring.druid")

    @Bean(initMethod = "init",destroyMethod = "close")
    public DruidDataSource dataSource(){
        DruidDataSource dataSource=new DruidDataSource();
        return  dataSource;
    }

//    慢查询日志过滤器
//    @Bean
//    public StatFilter　statFilter(){
//        StatFilter statFilter=new StatFilter();
//        statFilter.setSlowSqlMillis(5000);
//        statFilter.setLogSlowSql(true);
//        statFilter.setMergeSql(true);
//        return statFilter;
//    }


}
