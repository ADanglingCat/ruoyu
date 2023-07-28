package com.npc.ruoyu.common.service.handler;

import com.npc.ruoyu.common.service.model.CommonException;
import com.npc.ruoyu.common.service.model.CommonResult;
import com.npc.ruoyu.common.service.util.LogUtil;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @author Ted
 * @version 2023/7/24
 **/
@RestControllerAdvice
public class GlobalExceptionHandler {
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
