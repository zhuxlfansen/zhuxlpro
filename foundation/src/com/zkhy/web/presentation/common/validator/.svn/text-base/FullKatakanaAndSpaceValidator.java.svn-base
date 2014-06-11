package com.zkhy.web.presentation.common.validator;

import com.zkhy.web.core.constants.LabelCode;
import com.zkhy.web.core.constants.MessageCode;

/**
 * 全角カナ、全角空格
 */
public class FullKatakanaAndSpaceValidator extends SimpleRegexValidator {
    // 正規表現
    private static final String REGEX = "^[ア-ン゛゜ァ-ォャ-ョー「」、　]+$";

    /**
     * コンストラクタ
     *
     * @param itemName アイテム名
     * @param itemLabel アイテムラベル
     */
    public FullKatakanaAndSpaceValidator(String itemName, LabelCode itemLabel) {
        super(itemName, itemLabel, REGEX, MessageCode.UNKNOW);
    }
}
