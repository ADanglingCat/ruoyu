package com.npc.ruoyu.product.domain.po;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author Ted
 * @since 2023/8/1
 **/
@Data
public class Product implements Serializable {
    private long id;
    private String productName;
    private BigDecimal productPrice;
    private int productStock;
    private long createTime;
    private long updateTime;
}
