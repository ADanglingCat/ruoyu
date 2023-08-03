package com.npc.ruoyu.common.service.util;

import com.npc.ruoyu.common.core.model.Snowflake;
import org.springframework.util.ObjectUtils;

/**
 * @author Ted
 * @version 2023/7/24
 **/
public class CommonUtil {
    /**
     * 雪花算法
     *
     * @return 唯一id
     */
    public static Long getGlobalId() {
        return Snowflake.nextId();
    }

    /**
     * @param obj obj
     * @return 类是否为空
     */
    public static boolean isEmpty(Object obj) {
        return ObjectUtils.isEmpty(obj);
    }

    /**
     * @param obj obj
     * @return 类是否不为空
     */
    public static boolean isNotEmpty(Object obj) {
        return !isEmpty(obj);
    }
}
