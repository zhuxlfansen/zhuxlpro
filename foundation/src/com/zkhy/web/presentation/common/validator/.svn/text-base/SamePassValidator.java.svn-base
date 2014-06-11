package com.zkhy.web.presentation.common.validator;

import java.util.Locale;

import org.apache.commons.lang3.StringEscapeUtils;

import com.zkhy.web.core.constants.MessageCode;
import com.zkhy.web.core.util.ReflectUtil;
import com.zkhy.fw.core.i18n.I18nContext;
import com.zkhy.fw.core.i18n.I18nMessage;
import com.zkhy.fw.core.i18n.I18nMessageAccessor;
import com.zkhy.fw.presentation.form.BaseForm;
import com.zkhy.fw.presentation.validator.AbstractValidator;

/**
 * 新パスワードとパスワード確認が一致しないことのチェック
 *
 * @author kxiong
 *
 */
public class SamePassValidator extends AbstractValidator {
    // 項目(Name)
    protected String itemPass;
    // 項目(Name)
    protected String itemPass2;
    // エラーメッセージ
    protected I18nMessage errMsg = null;

    /**
     * コンストラクタ
     * @param itemPass itemPass
     * @param itemPass2 itemPass2
     */
    public SamePassValidator(String itemPass, String itemPass2) {
        super(itemPass);
        // アイテム名
        this.itemPass = itemPass;
        this.itemPass2 = itemPass2;
    }

    private boolean isNg(BaseForm e) {
        String pass = ReflectUtil.getFieldStringValue(e, this.itemPass);
        String pass2 = ReflectUtil.getFieldStringValue(e, this.itemPass2);
        if (pass == null || pass2 == null) {
            return true;
        }
        return !pass.equals(pass2);
    }

    private I18nMessage getErrorMessage(I18nContext context) {
        if (this.errMsg == null) {
            I18nMessageAccessor accessor = context.getMessageSource();
            Locale locale = context.getLocale();
            // エラーメッセージ
            this.errMsg = new I18nMessage(accessor, locale, MessageCode.UNKNOW);
        }
        return this.errMsg;
    }

    @Override
    public I18nMessage validate(BaseForm form, I18nContext context) {
        if (isNg(form)) {
            return this.getErrorMessage(context);
        }
        return null;
    }

    @Override
    protected StringBuilder toJsRule(I18nContext context) {
        StringBuilder sb = new StringBuilder();
        sb.append(BUILDER_VAR).append(".add(");
        sb.append("new SamePassValidator(");
        sb.append("\"" + StringEscapeUtils.escapeEcmaScript(this.itemPass) + "\", ");
        sb.append("\"" + StringEscapeUtils.escapeEcmaScript(this.itemPass2) + "\", ");
        String text = getErrorMessage(context).getText();
        sb.append("\"" + StringEscapeUtils.escapeEcmaScript(text) + "\")");
        sb.append(");");
        return sb;
    }
}
