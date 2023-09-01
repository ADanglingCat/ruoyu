package com.npc.ruoyu.common.product.domain.type;

import com.npc.ruoyu.common.core.model.ICommonStatus;

/**
 * @author Ted
 * @since 2023/8/11
 **/
public enum ProductApiStatus implements ICommonStatus {
    SUCCESS(200, "成功"),
    CLIENT_ERROR(400, "请求异常"),
    SERVER_ERROR(500, "服务器异常"),
    UNAUTHORIZED(401, "未登录"),
    FORBIDDEN(403, "无权限"),
    ;

    private final int code;
    private final String msg;

    ProductApiStatus(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
    @Override
    public int getCode() {
        return code;
    }

    @Override
    public String getMsg() {
        return msg;
    }
}
