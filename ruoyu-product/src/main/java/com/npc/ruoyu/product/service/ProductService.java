package com.npc.ruoyu.product.service;

import com.npc.ruoyu.common.core.model.CommonException;
import com.npc.ruoyu.common.core.model.CommonStatus;
import com.npc.ruoyu.product.dao.ProductMapper;
import com.npc.ruoyu.product.domain.po.Product;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * @author Ted
 * @since 2023/8/2
 **/
@RequiredArgsConstructor
@Service
public class ProductService {
    private final ProductMapper productMapper;

    public Product getProductById(long id) {
        return productMapper.getProductById(id);
    }

    public Product updateProductStock(Product product) {
        product.setUpdateTime(System.currentTimeMillis());
        int count = productMapper.updateProductStockById(product);
        if (count == 1) {
            return product;
        }
        throw new CommonException(CommonStatus.CLIENT_ERROR.getMsg());
    }
}
