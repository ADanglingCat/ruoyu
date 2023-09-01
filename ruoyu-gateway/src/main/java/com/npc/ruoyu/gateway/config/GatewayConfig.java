package com.npc.ruoyu.gateway.config;

import com.alibaba.csp.sentinel.adapter.gateway.sc.callback.GatewayCallbackManager;
import com.npc.ruoyu.common.core.model.CommonResult;
import jakarta.annotation.PostConstruct;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.server.ServerResponse;

/**
 * @author Ted
 * @since 2023/9/1
 **/
@Configuration
public class GatewayConfig {
    @PostConstruct
    public void initBlockHandler() {
        GatewayCallbackManager.setBlockHandler((serverWebExchange, throwable) ->
                ServerResponse.status(HttpStatus.OK)
                        .contentType(MediaType.APPLICATION_JSON)
                        .body(BodyInserters.fromValue(CommonResult.failure())));
    }
}
