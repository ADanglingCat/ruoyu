package com.npc.ruoyu.common.service.util;

import com.npc.ruoyu.common.service.model.Snowflake;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collection;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * @author Ted
 * @version  2022/5/13
 **/
public class LogUtil {
    private static final Logger log = LoggerFactory.getLogger("");

    public static void info(String info, Object... params) {
        var exception = new Exception().getStackTrace()[1];
        String className = exception.getClassName();
        String methodName = exception.getMethodName();
        log.info("info {} {} {} {}", className, methodName, info
                , Arrays.stream(params).map(String::valueOf).collect(Collectors.joining(",")));
    }

    public static void warn(String info, Object... params) {
        var exception = new Exception().getStackTrace()[1];
        String className = exception.getClassName();
        String methodName = exception.getMethodName();
        log.warn("info {} {} {} {}", className, methodName, info
                , Arrays.stream(params).map(String::valueOf).collect(Collectors.joining(",")));
    }

    public static void error(String info, Throwable e) {
        log.error("error {}", info, e);
    }

    public static void error(Throwable e) {
        log.error("error ", e);
    }

}
