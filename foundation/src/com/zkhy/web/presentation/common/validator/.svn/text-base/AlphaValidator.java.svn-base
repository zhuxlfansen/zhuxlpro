package com.zkhy.web.presentation.common.validator;

import com.zkhy.web.core.constants.LabelCode;
import com.zkhy.web.core.constants.MessageCode;

/**
 * 半角英字チェック
 */
public class AlphaValidator extends SimpleRegexValidator {
    // 正規表現
    private static final String REGEX = "^[A-Za-z]+$";

    /**
     * コンストラクタ
     *
     * @param itemName アイテム名
     * @param itemLabel アイテムラベル
     */
    public AlphaValidator(String itemName, LabelCode itemLabel) {
        super(itemName, itemLabel, REGEX, MessageCode.UNKNOW);
    }
}
