package com.zkhy.web.presentation.common.validator;

import com.zkhy.web.core.constants.LabelCode;
import com.zkhy.web.core.constants.MessageCode;

/**
 * 電話番号チェック
 */
public class TelValidator extends SimpleRegexValidator {
    // 正規表現
    private static final String REGEX = "^[0-9\\-]+$";

    /**
     * コンストラクタ
     *
     * @param itemName アイテム名
     * @param itemLabel アイテムラベル
     */
    public TelValidator(String itemName, LabelCode itemLabel) {
        // 親のコンストラクタ
        super(itemName, itemLabel, REGEX, MessageCode.UNKNOW);
    }
}
