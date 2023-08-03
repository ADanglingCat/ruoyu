package com.npc.ruoyu.user.dao;

import com.npc.ruoyu.user.domain.po.User;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * @author Ted
 * @since 2023/7/26
 **/
@Repository
public interface UserMapper {
    @Select("select * from user where id = #{id}")
    User getUserById(long id);
}
