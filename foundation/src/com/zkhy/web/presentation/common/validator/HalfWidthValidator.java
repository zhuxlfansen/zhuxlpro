package com.zkhy.web.presentation.common.validator;

import com.zkhy.web.core.constants.LabelCode;
import com.zkhy.web.core.constants.MessageCode;

/**
 * 半角文字チェック
 *
 * @author HUIYU
 *
 */
public class HalfWidthValidator extends SimpleRegexValidator {
    // 正規表現
    private static final String REGEX = "^[\u0020-\u007e\uff61-\uffef]*$";

    /**
     * コンストラクタ
     *
     * @param itemName アイテム名
     * @param itemLabel アイテムラベル
     */
    public HalfWidthValidator(String itemName, LabelCode itemLabel) {
        super(itemName, itemLabel, REGEX, MessageCode.UNKNOW);
    }
}
