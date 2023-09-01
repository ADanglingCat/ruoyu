package com.npc.ruoyu.order.domain.vo;

import com.npc.ruoyu.order.domain.po.OrderInfo;
import lombok.Data;

import java.util.List;

/**
 * @author Ted
 * @since 2023/8/24
 **/
@Data
public class OrderVo extends OrderInfo {
    private List<OrderInfo> orderInfos;
}
