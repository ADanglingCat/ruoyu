package com.npc.ruoyu.common.product.api;

import com.npc.ruoyu.common.core.model.CommonResult;
import com.npc.ruoyu.common.product.domain.dto.ProductDto;
import com.npc.ruoyu.common.product.domain.vo.ProductVo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * @author Ted
 * @since 2023/8/2
 **/
@FeignClient(name = "ruoyu-product", contextId = "ProductApi", path = "/ruoyu-product/product")
public interface ProductApi {
    @GetMapping("/{id}")
    CommonResult<ProductVo> getProductById(@PathVariable("id") long id);

    @PutMapping("/stock")
    CommonResult<ProductVo> updateProductStock(@RequestBody ProductDto productDto);
}
