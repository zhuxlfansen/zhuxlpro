package com.zkhy.web.presentation.common.validator;

import java.util.Locale;

import com.zkhy.web.core.constants.LabelCode;
import com.zkhy.web.core.constants.MessageCode;
import com.zkhy.fw.core.i18n.I18nContext;
import com.zkhy.fw.core.i18n.I18nMessage;
import com.zkhy.fw.core.i18n.I18nMessageAccessor;

/**
 * 必須入力チェック
 *
 * @author kxiong
 *
 */
public class MustSelectValidator extends MustInputValidator {

    /**
     * コンストラクタ
     *
     * @param itemName アイテム
     * @param itemLabel アイテムラベル
     */
    public MustSelectValidator(String itemName, LabelCode itemLabel) {
        super(itemName, itemLabel);
    }

    @Override
    protected I18nMessage getErrorMessage(I18nContext context) {
        if (this.errMsg == null) {
            // MessageAccessor
            I18nMessageAccessor accessor = context.getMessageSource();
            // ローカル
            Locale locale = context.getLocale();
            // ラベル
            String i18nLabel = accessor.getMessage(this.itemLabel, locale);
            // エラーメッセージ
            this.errMsg = new I18nMessage(accessor, locale, MessageCode.UNKNOW, i18nLabel);
        }
        return this.errMsg;
    }
}
