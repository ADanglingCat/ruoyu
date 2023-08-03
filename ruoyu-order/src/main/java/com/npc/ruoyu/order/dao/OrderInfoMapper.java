package com.npc.ruoyu.order.dao;

import com.npc.ruoyu.order.domain.po.OrderInfo;
import org.springframework.stereotype.Repository;

/**
 * @author Ted
 * @since 2023/8/1
 **/
@Repository
public interface OrderInfoMapper {
    int insert(OrderInfo orderInfo);
}
