package com.npc.ruoyu.product;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * @author Ted
 * @since 2023/8/1
 **/
@ComponentScan("com.npc.ruoyu")
@MapperScan("com.npc.ruoyu.product.dao")
@EnableScheduling
@EnableAsync
@SpringBootApplication
public class RuoyuProductApplication {
    public static void main(String[] args) {
        SpringApplication.run(RuoyuProductApplication.class, args);
    }
}
