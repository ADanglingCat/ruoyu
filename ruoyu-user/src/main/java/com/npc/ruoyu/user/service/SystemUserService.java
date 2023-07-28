package com.npc.ruoyu.user.service;

import com.npc.ruoyu.user.dao.SystemUserMapper;
import com.npc.ruoyu.user.domain.po.SystemUser;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * @author Ted
 * @version 2023/7/26
 **/
@RequiredArgsConstructor
@Service
public class SystemUserService {
    private final SystemUserMapper systemUserMapper;

    public SystemUser getUser(long id) {
        var systemUser = new SystemUser();
        systemUser.setSystemUserId(id);
        return systemUserMapper.getUserById(systemUser);
    }
}
