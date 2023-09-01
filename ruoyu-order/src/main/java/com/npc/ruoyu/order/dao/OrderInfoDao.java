package com.npc.ruoyu.order.dao;

import com.npc.ruoyu.order.domain.po.OrderInfo;
import com.npc.ruoyu.order.domain.vo.OrderVo;
import org.springframework.stereotype.Repository;

/**
 * @author Ted
 * @since 2023/8/1
 **/
@Repository
public interface OrderInfoDao {
    int insert(OrderInfo orderInfo);

    OrderInfo selectById(long id);

    OrderVo selectOrderVoById(long id);
}
