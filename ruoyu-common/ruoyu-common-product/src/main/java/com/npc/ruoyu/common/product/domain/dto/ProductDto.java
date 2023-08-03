package com.npc.ruoyu.common.product.domain.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author Ted
 * @since 2023/8/2
 **/
@Data
public class ProductDto implements Serializable {
    private long id;
    private int productStock;
}
