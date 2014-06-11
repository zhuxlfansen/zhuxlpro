package com.zkhy.web.presentation.common.validator;

import com.zkhy.web.core.constants.LabelCode;
import com.zkhy.web.core.constants.MessageCode;

/**
 * 日時の時分（HHMM）チェック
 *
 */
public class Time4Validator extends SimpleRegexValidator {
    // 正規表現
    private static final String REGEX = "^([0-1][0-9]|2[0-3])([0-5][0-9])$";

    /**
     * コンストラクタ
     *
     * @param itemName アイテム名
     * @param itemLabel アイテムラベル
     */
    public Time4Validator(String itemName, LabelCode itemLabel) {
        // 親のコンストラクタ
        super(itemName, itemLabel, REGEX, MessageCode.UNKNOW);
    }
}
