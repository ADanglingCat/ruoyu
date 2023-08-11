package com.npc.ruoyu.common.service.handler;

import com.npc.ruoyu.common.core.model.CommonException;
import com.npc.ruoyu.common.core.model.CommonResult;
import com.npc.ruoyu.common.service.util.LogUtil;
import org.jetbrains.annotations.NotNull;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyAdvice;

/**
 * @author Ted
 * @version 2023/7/24
 **/
@ConditionalOnWebApplication(type = ConditionalOnWebApplication.Type.SERVLET)
@RestControllerAdvice
public class CommonResponseHandler implements ResponseBodyAdvice<Object> {
    @Override
    public boolean supports(@NotNull MethodParameter returnType,
                            @NotNull Class<? extends HttpMessageConverter<?>> converterType) {
        //doing 2023/8/4 supports CommonResponseHandler
        return true;
    }

    @Override
    public Object beforeBodyWrite(Object body,
                                  @NotNull MethodParameter returnType,
                                  @NotNull MediaType selectedContentType,
                                  @NotNull Class<? extends HttpMessageConverter<?>> selectedConverterType,
                                  @NotNull ServerHttpRequest request,
                                  @NotNull ServerHttpResponse response) {
        if (body instanceof CommonResult) {
            return body;
        }
        response.getHeaders().setContentType(MediaType.APPLICATION_JSON);
        return CommonResult.success(body);
    }

    @ExceptionHandler(Exception.class)
    public CommonResult<?> exceptionHandler(Exception e) {
        LogUtil.error(e);
        return CommonResult.failure();
    }

    @ExceptionHandler(CommonException.class)
    public CommonResult<?> blogExceptionHandler(CommonException e) {
        LogUtil.error(e);
        return CommonResult.failure();
    }
}
