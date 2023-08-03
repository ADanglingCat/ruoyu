package com.npc.ruoyu.common.product.domain.vo;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author Ted
 * @since 2023/8/2
 **/
@Data
public class ProductVo implements Serializable {
    private long id;
    private String productName;
    private BigDecimal productPrice;
    private int productStock;
}
