package com.npc.ruoyu.common.service.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Ted
 * @version 2022/5/13
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommonResult<T> {
    private Integer code;
    private String msg;
    private T data;

    public static <T> CommonResult<T> success() {
        return success(null);
    }

    public static <T> CommonResult<T> success(T data) {
        return new CommonResult<>(ICommonStatus.CODE_OK, ICommonStatus.MSG_OK, data);
    }

    public static <T> CommonResult<T> failure() {
        return failure(ICommonStatus.MSG_SERVER_ERROR);
    }

    public static <T> CommonResult<T> failure(String msg) {
        return new CommonResult<>(ICommonStatus.CODE_SERVER_ERROR, msg, null);
    }

    public static <T> CommonResult<T> badRequest() {
        return badRequest(ICommonStatus.MSG_CLIENT_ERROR);
    }

    public static <T> CommonResult<T> badRequest(String msg) {
        return new CommonResult<>(ICommonStatus.CODE_SERVER_ERROR, msg, null);
    }

    public static <T> CommonResult<T> result(ICommonStatus commonStatus) {
        return result(commonStatus, null);
    }

    public static <T> CommonResult<T> result(ICommonStatus commonStatus, T data) {
        return new CommonResult<>(commonStatus.getCode(), commonStatus.getMsg(), data);
    }

    public boolean assertSuccess() {
        return ICommonStatus.CODE_OK.equals(code);
    }
}
