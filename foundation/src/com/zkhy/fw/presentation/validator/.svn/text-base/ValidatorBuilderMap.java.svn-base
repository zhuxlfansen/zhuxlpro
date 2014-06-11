package com.zkhy.fw.presentation.validator;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.zkhy.fw.presentation.form.BaseForm;

/**
 * ValidatorBuilderMap
 *
 * @author guozhiqiang
 *
 */
public class ValidatorBuilderMap {

    Map<String, ValidatorBuilder> map = new HashMap<String, ValidatorBuilder>();

    /**
     * ValidatorBuilderを追加する。
     *
     * @param builder ValidatorBuilder
     */
    public void add(ValidatorBuilder builder) {
        add(builder.getClazz().getSimpleName(), builder);
    }

    /**
     * ValidatorBuilderを追加する。
     *
     * @param key String
     * @param builder ValidatorBuilder
     */
    public void add(String key, ValidatorBuilder builder) {
        map.put(key, builder);
    }

    /**
     * ValidatorBuilderを取得する。
     *
     * @param key キー
     * @return ValidatorBuilder
     */
    public ValidatorBuilder get(String key) {
        return map.get(key);
    }

    /**
     * ValidatorBuilderを取得する。
     *
     * @param clazz クラス
     * @return ValidatorBuilder
     */
    public ValidatorBuilder get(Class<? extends BaseForm> clazz) {
        return get(clazz.getSimpleName());
    }

    /**
     * 全てのValidatorBuilderを取得する。
     *
     * @return ValidatorBuilder
     */
    public Collection<ValidatorBuilder> allBuilders() {
        return map.values();
    }
}
