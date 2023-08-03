package com.npc.ruoyu.order.domain.dto;

import lombok.Data;

/**
 * @author Ted
 * @since 2023/8/2
 **/
@Data
public class OrderDto {
    private long userId;
    private String phone;
    private String address;
    private long productId;
    private int productCount;
}
