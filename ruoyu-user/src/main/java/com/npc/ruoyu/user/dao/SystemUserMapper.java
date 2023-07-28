package com.npc.ruoyu.user.dao;

import com.npc.ruoyu.user.domain.po.SystemUser;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * @author Ted
 * @since 2023/7/26
 **/
@Repository
public interface SystemUserMapper {
    @Select("select * from system_user where system_user_id = #{systemUserId}")
    SystemUser getUserById(SystemUser systemUser);
}
