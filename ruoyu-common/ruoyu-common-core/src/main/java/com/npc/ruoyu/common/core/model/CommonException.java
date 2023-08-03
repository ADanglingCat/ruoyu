package com.npc.ruoyu.common.core.model;

/**
 * @author Ted
 * @version 2023/7/24
 **/
public class CommonException extends RuntimeException {
    private final ICommonStatus commonStatus;

    public CommonException(ICommonStatus commonStatus) {
        super(commonStatus.getMsg());
        this.commonStatus = commonStatus;
    }

    public ICommonStatus getCommonStatus() {
        return commonStatus;
    }
}
