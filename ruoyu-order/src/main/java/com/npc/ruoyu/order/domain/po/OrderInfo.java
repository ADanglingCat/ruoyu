package com.npc.ruoyu.order.domain.po;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author Ted
 * @since 2023/8/1
 **/
@Data
public class OrderInfo implements Serializable {
    private long id;
    private long userId;
    private String userName;
    private String phone;
    private String address;
    private BigDecimal totalPrice;
    private long createTime;
    private long updateTime;
}
