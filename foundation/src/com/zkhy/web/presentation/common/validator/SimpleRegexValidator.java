package com.zkhy.web.presentation.common.validator;

import java.util.Locale;

import com.zkhy.web.core.constants.LabelCode;
import com.zkhy.web.core.constants.MessageCode;
import com.zkhy.fw.core.i18n.I18nMessage;
import com.zkhy.fw.core.i18n.I18nMessageAccessor;

/**
 * 簡単な正規表現Validator
 *
 */
public class SimpleRegexValidator extends RegexValidator {
    /**
     * エラーメッセージ
     */
    private I18nMessage errMsg = null;

    /**
     * アイテムラベル
     */
    private LabelCode itemLabel = null;

    /**
     * アイテムラベル
     */
    private String regex = null;

    /**
     * アイテムラベル
     */
    private MessageCode code = null;

    /**
     * コンストラクタ
     *
     * @param itemName アイテム名
     * @param itemLabel アイテムラベル
     * @param regex 正規表現
     * @param code メッセージコード
     */
    public SimpleRegexValidator(String itemName, LabelCode itemLabel, String regex, MessageCode code) {
        super(itemName);
        this.itemLabel = itemLabel;
        this.regex = regex;
        this.code = code;
    }

    /**
     * 正規表現を取得する。
     *
     * @return
     */
    @Override
    protected final String getRegex() {
        return this.regex;
    }

    /**
     * メッセージコードを取得する。
     *
     * @return メッセージコード
     */
    protected final MessageCode getMessageCode() {
        return this.code;
    }

    @Override
    protected final I18nMessage getErrorMessage(I18nMessageAccessor accessor, Locale locale) {
        if (this.errMsg == null) {
            if (this.itemLabel == null) {
                this.errMsg = new I18nMessage(accessor, locale, getMessageCode());
            } else {
                String i18nItemName = accessor.getMessage(itemLabel, locale);
                Object[] params = new Object[]{i18nItemName};
                this.errMsg = new I18nMessage(accessor, locale, getMessageCode(), params);
            }
        }
        return this.errMsg;
    }
}
