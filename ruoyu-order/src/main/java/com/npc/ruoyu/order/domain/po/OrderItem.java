package com.npc.ruoyu.order.domain.po;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author Ted
 * @since 2023/8/1
 **/
@Data
public class OrderItem implements Serializable {
    private long id;
    private long orderInfoId;
    private long productId;
    private String productName;
    private BigDecimal productPrice;
    private int productCount;
    private long createTime;
    private long updateTime;
}
