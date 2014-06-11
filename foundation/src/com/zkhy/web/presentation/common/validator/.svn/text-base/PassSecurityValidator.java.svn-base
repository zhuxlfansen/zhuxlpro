package com.zkhy.web.presentation.common.validator;

import java.util.Locale;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;

import com.zkhy.web.core.constants.MessageCode;
import com.zkhy.web.core.util.ReflectUtil;
import com.zkhy.fw.core.i18n.I18nContext;
import com.zkhy.fw.core.i18n.I18nMessage;
import com.zkhy.fw.core.i18n.I18nMessageAccessor;
import com.zkhy.fw.presentation.form.BaseForm;
import com.zkhy.fw.presentation.validator.AbstractValidator;

/**
 * 新パスワードに英字、数字、あるいは特殊文字が入力されたことのチェック
 *
 * @author kxiong
 *
 */
public class PassSecurityValidator extends AbstractValidator {
    //
    private static final String SEP_CHARS = "!-@_.";

    // 項目(Name)
    protected String itemName;
    // エラーメッセージ
    protected I18nMessage errMsg = null;

    /**
     * コンストラクタ
     * @param itemName アイテム名
     */
    public PassSecurityValidator(String itemName) {
        super(itemName);
        // アイテム名
        this.itemName = itemName;
    }

    private boolean isNg(BaseForm e) {
        String value = ReflectUtil.getFieldStringValue(e, this.itemName);
        // NULL許容しない
        if (value == null || StringUtils.isBlank(value)) {
            return true;
        }
        int hasWord = 0;
        int hasNumber = 0;
        int hasSep = 0;
        char[] s = value.toCharArray();
        for (int i = 0; i < s.length; i++) {
            if ((s[i] >= 'A' && s[i] <= 'Z') || (s[i] >= 'a' && s[i] <= 'z')) {
                hasWord = 1;
            } else if (s[i] >= '0' && s[i] <= '9') {
                hasNumber = 1;
            } else if (SEP_CHARS.indexOf(s[i]) != -1) {
                hasSep = 1;
            }
        }
        return ((hasWord + hasNumber + hasSep) < 2);
    }

    private I18nMessage getErrorMessage(I18nMessageAccessor accessor, Locale locale) {
        if (this.errMsg == null) {
            // エラーメッセージ
            this.errMsg = new I18nMessage(accessor, locale, MessageCode.UNKNOW);
        }
        return this.errMsg;
    }

    @Override
    public I18nMessage validate(BaseForm e, I18nContext context) {
        I18nMessageAccessor accessor = context.getMessageSource();
        Locale locale = context.getLocale();
        if (isNg(e)) {
            return this.getErrorMessage(accessor, locale);
        }
        return null;
    }

    @Override
    protected StringBuilder toJsRule(I18nContext context) {
        I18nMessageAccessor accessor = context.getMessageSource();
        Locale locale = context.getLocale();
        StringBuilder sb = new StringBuilder();
        sb.append(BUILDER_VAR).append(".add(");
        sb.append("new PassSecurityValidator(");
        sb.append("\"" + StringEscapeUtils.escapeEcmaScript(this.itemName) + "\", ");
        String text = getErrorMessage(accessor, locale).getText();
        sb.append("\"" + StringEscapeUtils.escapeEcmaScript(text) + "\")");
        sb.append(");");
        return sb;
    }
}
