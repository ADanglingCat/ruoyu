package com.npc.ruoyu.order.dao;

import com.npc.ruoyu.order.domain.po.OrderItem;
import org.springframework.stereotype.Repository;

/**
 * @author Ted
 * @since 2023/8/1
 **/
@Repository
public interface OrderItemMapper {
    int insert(OrderItem orderItem);
}