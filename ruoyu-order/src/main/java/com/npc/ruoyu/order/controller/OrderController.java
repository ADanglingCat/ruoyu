package com.npc.ruoyu.order.controller;

import com.npc.ruoyu.order.domain.dto.OrderDto;
import com.npc.ruoyu.order.domain.vo.OrderVo;
import com.npc.ruoyu.order.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author Ted
 * @since 2023/8/2
 **/
@RequiredArgsConstructor
@RequestMapping("/order")
@RestController
public class OrderController {
    private final OrderService orderService;

    //doing 2023/8/3 createOrder 幂等性
    @PostMapping
    public void createOrder(@RequestBody OrderDto orderDto) {
        orderService.createOrder(orderDto);
    }

    @GetMapping("/{id}")
    public OrderVo getOrder(@PathVariable("id") long id) {
        return orderService.getOrderById(id);
    }

}
