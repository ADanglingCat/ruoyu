package com.npc.ruoyu.user.controller;

import com.npc.ruoyu.common.service.model.CommonResult;
import com.npc.ruoyu.user.service.SystemUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Ted
 * @version 2023/7/26
 **/
@RequiredArgsConstructor
@RequestMapping("/user")
@RestController
public class SystemUserController {
    private final SystemUserService systemUserService;

    @GetMapping("/{id}")
    public CommonResult<?> getUser(@PathVariable("id") long id) {
        return CommonResult.success(systemUserService.getUser(id));
    }
}
