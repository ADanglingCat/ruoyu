package com.npc.ruoyu.user.service;

import com.npc.ruoyu.user.dao.UserMapper;
import com.npc.ruoyu.user.domain.po.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * @author Ted
 * @version 2023/7/26
 **/
@RequiredArgsConstructor
@Service
public class UserService {
    private final UserMapper userMapper;

    public User getUser(long id) {
        return userMapper.getUserById(id);
    }
}
