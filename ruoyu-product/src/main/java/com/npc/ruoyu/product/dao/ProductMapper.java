package com.npc.ruoyu.product.dao;

import com.npc.ruoyu.product.domain.po.Product;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

/**
 * @author Ted
 * @version 2023/8/1
 **/
@Repository
public interface ProductMapper {
    @Update("update product set product_stock = product_stock - #{productStock}, update_time = #{update_time} where id = #{id}")
    int updateProductStockById(Product product);

    @Select("select * from product where id = #{id}")
    Product getProductById(long id);

}
