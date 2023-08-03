package com.npc.ruoyu.common.core.model;

import lombok.Data;

/**
 * @author Ted
 * @version 2022/5/13
 **/
@Data
public class CommonResult<T> {
    private Integer code;
    private String msg;
    private T data;

    private CommonResult () {}

    private CommonResult (int code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static <T> CommonResult<T> success() {
        return success(null);
    }

    public static <T> CommonResult<T> success(T data) {
        return new CommonResult<>(CommonStatus.SUCCESS.getCode(), CommonStatus.SUCCESS.getMsg(), data);
    }

    public static <T> CommonResult<T> failure() {
        return failure(CommonStatus.SERVER_ERROR.getMsg());
    }

    public static <T> CommonResult<T> failure(String msg) {
        return new CommonResult<>(CommonStatus.SERVER_ERROR.getCode(), msg, null);
    }

    public static <T> CommonResult<T> badRequest() {
        return badRequest(CommonStatus.CLIENT_ERROR.getMsg());
    }

    public static <T> CommonResult<T> badRequest(String msg) {
        return new CommonResult<>(CommonStatus.CLIENT_ERROR.getCode(), msg, null);
    }

    public static <T> CommonResult<T> result(ICommonStatus commonStatus) {
        return result(commonStatus, null);
    }

    public static <T> CommonResult<T> result(ICommonStatus commonStatus, T data) {
        return new CommonResult<>(commonStatus.getCode(), commonStatus.getMsg(), data);
    }

    public boolean assertSuccess() {
        return CommonStatus.SUCCESS.getCode().equals(this.code);
    }
}
