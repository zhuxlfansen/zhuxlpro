package com.zkhy.web.presentation.common.validator;

import com.zkhy.web.core.constants.LabelCode;
import com.zkhy.web.core.constants.MessageCode;

/**
 * メールアドレスが半角英数字、”@.-_”以外の登録ができない
 *
 */
public class MailAddressValidator extends SimpleRegexValidator {
    // 正規表現
    private static final String REGEX = "^[A-Za-z0-9@\\.\\-_]+$";

    /**
     * コンストラクタ
     *
     * @param itemName アイテム名
     * @param itemLabel アイテムラベル
     */
    public MailAddressValidator(String itemName, LabelCode itemLabel) {
        super(itemName, itemLabel, REGEX, MessageCode.UNKNOW);
    }
}
