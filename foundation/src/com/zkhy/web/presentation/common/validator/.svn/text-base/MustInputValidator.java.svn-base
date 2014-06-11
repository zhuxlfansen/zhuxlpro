package com.zkhy.web.presentation.common.validator;

import java.util.Locale;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;

import com.zkhy.web.core.constants.LabelCode;
import com.zkhy.web.core.constants.MessageCode;
import com.zkhy.web.core.util.ReflectUtil;
import com.zkhy.fw.core.i18n.I18nContext;
import com.zkhy.fw.core.i18n.I18nMessage;
import com.zkhy.fw.core.i18n.I18nMessageAccessor;
import com.zkhy.fw.presentation.form.BaseForm;
import com.zkhy.fw.presentation.validator.AbstractValidator;

/**
 * 必須入力チェック
 *
 * @author kxiong
 *
 */
public class MustInputValidator extends AbstractValidator {
    // 項目(Name)
    protected String itemName;
    // ラベル
    protected LabelCode itemLabel;
    // エラーメッセージ
    protected I18nMessage errMsg;

    /**
     * コンストラクタ
     *
     * @param itemName アイテム
     * @param itemLabel アイテムラベル
     */
    public MustInputValidator(String itemName, LabelCode itemLabel) {
        super(itemName);
        // アイテム名
        this.itemName = itemName;
        //
        this.itemLabel = itemLabel;
    }

    private boolean isNg(BaseForm e) {
        Object value = ReflectUtil.getFieldValue(e, this.itemName);
        if (value == null) {
            return false;
        }
        String str = String.valueOf(value);
        return StringUtils.isBlank(str);
    }

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

    @Override
    public I18nMessage validate(BaseForm e, I18nContext context) {
        if (isNg(e)) {
            return getErrorMessage(context);
        }
        return null;
    }

    @Override
    protected StringBuilder toJsRule(I18nContext context) {
        StringBuilder sb = new StringBuilder();
        sb.append(BUILDER_VAR).append(".add(");
        sb.append("new MustInputValidator(");
        sb.append("\"" + StringEscapeUtils.escapeEcmaScript(this.itemName) + "\", ");
        String message = this.getErrorMessage(context).getText();
        sb.append("\"" + StringEscapeUtils.escapeEcmaScript(message) + "\")");
        sb.append(");");
        return sb;
    }
}
