package com.zkhy.fw.presentation.form;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;

import com.zkhy.fw.presentation.response.support.JsonResponseSupport;

/**
 * 基底フォームクラス
 *
 * @author CTC
 *
 */
@SuppressWarnings("serial")
public abstract class BaseForm implements JsonResponseSupport, Serializable {
    /**
     * フォームのTRIM
     */
    public void trimString() {
        trimString(false);
    }

    /**
     * フォームのTRIM
     *
     * @param nulltoEmpty null値を""に変更するフラグ
     */
    public void trimString(boolean nulltoEmpty) {
        // 全てのフィールドを取得する
        Field[] fields = this.getClass().getDeclaredFields();
        // 毎に繰り返し
        for (Field f : fields) {
            // STATICフィールドを対象外にする。
            if (Modifier.isStatic(f.getModifiers())) {
                continue;
            }
            // finalフィールドを対象外にする。
            if (Modifier.isFinal(f.getModifiers())) {
                continue;
            }
            if (!String.class.equals(f.getType())) {
                continue;
            }
            f.setAccessible(true);
            try {
                String value = (String) f.get(this);
                if (value == null) {
                    if (nulltoEmpty) {
                        f.set(this, "");
                    }
                } else {
                    f.set(this, value.trim());
                }
            } catch (IllegalArgumentException e) {
                //e.printStackTrace();
            } catch (IllegalAccessException e) {
                //e.printStackTrace();
            }
        }
    }

    /**
     * フォームのTRIM
     *
     * @param nullStrs null値を""に変更するフラグ
     * @param nullTo nullTo
     * @param isIgnoreCase isIgnoreCase
     */
    public void trimString(boolean isIgnoreCase, String nullTo, String... nullStrs) {
        // 全てのフィールドを取得する
        Field[] fields = this.getClass().getDeclaredFields();
        // 毎に繰り返し
        for (Field f : fields) {
            // STATICフィールドを対象外にする。
            if (Modifier.isStatic(f.getModifiers())) {
                continue;
            }
            // finalフィールドを対象外にする。
            if (Modifier.isFinal(f.getModifiers())) {
                continue;
            }
            if (!String.class.equals(f.getType())) {
                continue;
            }
            f.setAccessible(true);
            try {
                String value = (String) f.get(this);
                if (value != null) {
                    value = value.trim();
                }
                boolean isValNull = value == null;
                if (!isValNull && nullStrs != null && nullStrs.length > 0) {
                    for (String nullStr : nullStrs) {
                        if (isValNull) {
                            break;
                        }
                        isValNull = (isIgnoreCase && nullStr.equalsIgnoreCase(value)) || nullStr.equals(value);
                    }
                }
                if (isValNull) {
                    f.set(this, nullTo);
                } else {
                    f.set(this, value);
                }

            } catch (IllegalArgumentException e) {
                // e.printStackTrace();
            } catch (IllegalAccessException e) {
                // e.printStackTrace();
            }
        }
    }
}
