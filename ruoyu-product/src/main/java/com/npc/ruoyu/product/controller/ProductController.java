package com.npc.ruoyu.product.controller;

import com.npc.ruoyu.product.domain.po.Product;
import com.npc.ruoyu.product.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author Ted
 * @since 2023/8/2
 **/
@RequiredArgsConstructor
@RequestMapping("/product")
@RestController
public class ProductController {
    private final ProductService productService;

    @GetMapping("/{id}")
    public Product getProduct(@PathVariable("id") long id) {
        return productService.getProductById(id);
    }

    @PutMapping("/stock")
    public Product updateProductStock(@RequestBody Product product) {
        return productService.updateProductStock(product);
    }
}
