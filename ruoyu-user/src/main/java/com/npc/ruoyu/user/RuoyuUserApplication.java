package com.npc.ruoyu.user;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * @author Ted
 * @version 2023/7/26
 **/
@MapperScan("com.npc.ruoyu.user.dao")
@EnableScheduling
@EnableAsync
@SpringBootApplication
public class RuoyuUserApplication {
    public static void main(String[] args) {
        SpringApplication.run(RuoyuUserApplication.class, args);
    }
}
