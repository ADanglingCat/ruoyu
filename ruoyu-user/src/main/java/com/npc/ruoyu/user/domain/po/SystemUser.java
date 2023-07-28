package com.npc.ruoyu.user.domain.po;

import lombok.Data;

/**
 * @author Ted
 * @since 2023/7/26
 **/
@Data
public class SystemUser {
    public static final int STATUS_ENABLE = 1;
    public static final int STATUS_DISABLE = 2;
    private long systemUserId;
    private String userName;
    private String userPwd;
    private String nickName;
    private int userStatus;
}
