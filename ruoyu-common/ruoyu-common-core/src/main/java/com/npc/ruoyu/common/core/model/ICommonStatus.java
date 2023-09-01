package com.npc.ruoyu.common.core.model;

/**
 * @author Ted
 * @version 2022/5/13
 **/
public interface ICommonStatus {
    /**
     * 各模块自定义状态码
     * @return 状态码
     */
    int getCode();

    /**
     * 各模块自定义返回信息
     * @return 信息
     */
    String getMsg();
}
