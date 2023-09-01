package com.npc.ruoyu.common.product.api.fallback;

import com.npc.ruoyu.common.core.model.CommonResult;
import com.npc.ruoyu.common.product.api.ProductApi;
import com.npc.ruoyu.common.product.domain.dto.ProductDto;
import com.npc.ruoyu.common.product.domain.vo.ProductVo;
import org.springframework.stereotype.Component;

/**
 * @author Ted
 * @since 2023/8/11
 **/
@Component
public class ProductFallbackService implements ProductApi {
    @Override
    public CommonResult<ProductVo> getProductById(long id) {
        return CommonResult.failure("product 服务挂了");
    }

    @Override
    public CommonResult<ProductVo> updateProductStock(ProductDto productDto) {
        return CommonResult.failure("product 服务挂了");
    }
}
