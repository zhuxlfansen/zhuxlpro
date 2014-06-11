package com.zkhy.web.core.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/**
 * ReflectUtil
 *
 * @author guozhiqiang
 *
 */
public final class ReflectUtil {
    private ReflectUtil() {
    }

    /**
     * フィールド値を取得する。
     *
     * @param obj オブジェクト
     * @param fname フィールド名
     * @return フィールド値
     */
    public static String getFieldStringValue(Object obj, String fname) {
        Object value = getFieldValue(obj, fname);

        if (value == null) {
            return null;
        }
        return String.valueOf(value);
    }

    /**
     * getFieldValue
     *
     * @param obj オブジェクト
     * @param fname フィールド名
     * @return フィールド値
     */
    public static Object getFieldValue(Object obj, String fname) {
        if (obj == null || fname == null || "".equals(fname)) {
            return null;
        }
        Class<?> clazz = obj.getClass();
        try {
            String methodname = "get" + Character.toUpperCase(fname.charAt(0)) + fname.substring(1);
            Method method = clazz.getDeclaredMethod(methodname);
            if (!Modifier.isPublic(method.getModifiers())) {
                method.setAccessible(true);
            }
            return method.invoke(obj);
        } catch (Exception me) {
            try {
                Field field = clazz.getDeclaredField(fname);
                if (!Modifier.isPublic(field.getModifiers())) {
                    field.setAccessible(true);
                }
                return field.get(obj);
            } catch (Exception fe) {
                return null;
            }
        }
    }
}