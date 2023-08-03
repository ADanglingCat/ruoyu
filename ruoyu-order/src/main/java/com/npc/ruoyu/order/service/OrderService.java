package com.npc.ruoyu.order.service;

import com.npc.ruoyu.common.core.model.CommonException;
import com.npc.ruoyu.common.core.model.CommonStatus;
import com.npc.ruoyu.common.product.api.ProductApi;
import com.npc.ruoyu.common.product.domain.dto.ProductDto;
import com.npc.ruoyu.common.service.util.LogUtil;
import com.npc.ruoyu.order.dao.OrderInfoMapper;
import com.npc.ruoyu.order.dao.OrderItemMapper;
import com.npc.ruoyu.order.domain.dto.OrderDto;
import com.npc.ruoyu.order.domain.po.OrderInfo;
import com.npc.ruoyu.order.domain.po.OrderItem;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

/**
 * @author Ted
 * @since 2023/8/2
 **/
@RequiredArgsConstructor
@Service
public class OrderService {
    private final OrderItemMapper orderItemMapper;
    private final OrderInfoMapper orderInfoMapper;
    private final ProductApi productApi;

    @Transactional(rollbackFor = Exception.class)
    public void createOrder(OrderDto orderDto) {
        var productRet = productApi.getProductById(orderDto.getProductId());
        if (!productRet.assertSuccess()) {
            LogUtil.warn("query product failed", orderDto.getProductId());
            throw new CommonException(CommonStatus.CLIENT_ERROR);
        }
        var product = productRet.getData();
        if (product == null) {
            LogUtil.warn("query product empty", orderDto.getProductId());
            throw new CommonException(CommonStatus.CLIENT_ERROR);
        }
        if (product.getProductStock() < orderDto.getProductCount()) {
            LogUtil.warn("product stock is less than order count", product.getProductStock(), orderDto.getProductCount());
            throw new CommonException(CommonStatus.CLIENT_ERROR);
        }

        ProductDto productDto = new ProductDto();
        productDto.setId(product.getId());
        productDto.setProductStock(orderDto.getProductCount());
        var updateProductRet = productApi.updateProductStock(productDto);
        if (!updateProductRet.assertSuccess()) {
            LogUtil.warn("update product failed", orderDto.getProductId());
            throw new CommonException(CommonStatus.CLIENT_ERROR);
        }

        var time = System.currentTimeMillis();
        OrderInfo orderInfo = new OrderInfo();
        orderInfo.setUserId(1);
        orderInfo.setUserName("");
        orderInfo.setPhone("");
        orderInfo.setAddress("");
        orderInfo.setTotalPrice(BigDecimal.ONE);
        orderInfo.setCreateTime(time);
        orderInfo.setUpdateTime(time);
        var orderInfoRet = orderInfoMapper.insert(orderInfo);
        if (orderInfoRet != 1) {
            LogUtil.warn("update order info failed", orderDto.getProductId());
            throw new CommonException(CommonStatus.CLIENT_ERROR);
        }
        OrderItem orderItem = new OrderItem();
        orderItem.setOrderInfoId(orderInfo.getId());
        orderItem.setProductId(product.getId());
        orderItem.setProductName(product.getProductName());
        orderItem.setProductPrice(product.getProductPrice());
        orderItem.setProductCount(orderDto.getProductCount());
        orderItem.setCreateTime(time);
        orderItem.setUpdateTime(time);
        var orderItemRet = orderItemMapper.insert(orderItem);
        if (orderItemRet != 1) {
            LogUtil.warn("update order item failed", orderDto.getProductId());
            throw new CommonException(CommonStatus.CLIENT_ERROR);
        }
    }
}
