package com.npc.ruoyu.common.core.model;

/**
 * @author Ted
 * @since 2023/8/2
 **/
public enum CommonStatus implements ICommonStatus {
    SUCCESS(200, "成功"),
    CLIENT_ERROR(400, "请求异常"),
    SERVER_ERROR(500, "服务器异常"),
    UNAUTHORIZED(401, "未登录"),
    FORBIDDEN(403, "无权限"),
            ;

    private final int code;
    private final String msg;
    CommonStatus(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }


    @Override
    public Integer getCode() {
        return code;
    }

    @Override
    public String getMsg() {
        return msg;
    }
}
