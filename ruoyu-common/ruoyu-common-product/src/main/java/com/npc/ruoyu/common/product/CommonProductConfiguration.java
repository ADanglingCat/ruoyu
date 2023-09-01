package com.npc.ruoyu.common.product;

import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author Ted
 * @since 2023/8/2
 **/
@EnableFeignClients
@AutoConfiguration
@ComponentScan
public class CommonProductConfiguration {
}
