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
 * ユーザIDと同じ文字が3文字以上連続したことのチェック
 *
 * @author kxiong
 *
 */
public class UserPassSimilarValidator extends AbstractValidator {
    // 項目(Name)
    protected String itemPass;
    // 項目(Name)
    protected String itemUser;
    // エラーメッセージ
    protected I18nMessage errMsg = null;

    /**
     * コンストラクタ
     * @param itemPass itemPass
     * @param itemUser itemUser
     */
    public UserPassSimilarValidator(String itemPass, String itemUser) {
        super(itemPass);
        // アイテム名
        this.itemPass = itemPass;
        this.itemUser = itemUser;
    }

    private boolean isNg(BaseForm e) {
        String user = ReflectUtil.getFieldStringValue(e, this.itemPass);
        String pass = ReflectUtil.getFieldStringValue(e, this.itemUser);
        if (user == null || pass == null || user.length() < 3 || pass.length() < 3) {
            return false;
        }
        for (int i = 0; i < user.length() - 2; i++) {
            if (-1 != pass.indexOf(user.substring(i, i + 3))) {
                return true;
            }
        }
        return false;
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
        sb.append("new UserPassSimilarValidator(");
        sb.append("\"" + StringEscapeUtils.escapeEcmaScript(this.itemPass) + "\", ");
        sb.append("\"" + StringEscapeUtils.escapeEcmaScript(this.itemUser) + "\", ");
        String text = getErrorMessage(context).getText();
        sb.append("\"" + StringEscapeUtils.escapeEcmaScript(text) + "\")");
        sb.append(");");
        return sb;
    }
}
