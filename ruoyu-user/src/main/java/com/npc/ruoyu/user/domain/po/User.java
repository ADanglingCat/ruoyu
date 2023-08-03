package com.npc.ruoyu.user.domain.po;

import lombok.Data;

import java.io.Serializable;

/**
 * @author Ted
 * @since 2023/7/26
 **/
@Data
public class User implements Serializable {
    public static final int USER_STATUS_ENABLE = 1;
    public static final int USER_STATUS_DISABLE = 2;

    private long id;
    private String userName;
    private String userPwd;
    private String phone;
    private String address;
    private int userStatus;
    private long createTime;
    private long updateTime;

}
