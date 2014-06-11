package com.zkhy.web.presentation.common.validator;

import java.util.Locale;

import org.apache.commons.lang3.StringEscapeUtils;

import com.zkhy.web.core.constants.LabelCode;
import com.zkhy.web.core.constants.MessageCode;
import com.zkhy.web.core.util.ReflectUtil;
import com.zkhy.fw.core.i18n.I18nContext;
import com.zkhy.fw.core.i18n.I18nMessage;
import com.zkhy.fw.core.i18n.I18nMessageAccessor;
import com.zkhy.fw.presentation.form.BaseForm;
import com.zkhy.fw.presentation.validator.AbstractValidator;

/**
 * 桁数チェック
 *
 * @author kxiong
 */
public class LengthValidator extends AbstractValidator {
    // 項目(Name)
    protected String itemName;
    // 最小桁数
    protected int minLen = -1;
    // 最大桁数
    protected int maxLen = -1;
    // バイトチェック
    protected boolean btyeCheck = true;

    protected LabelCode itemLabel = null;
    // エラーメッセージ
    protected I18nMessage errMsg = null;

    /**
     * コンストラクタ
     *
     * @param itemName アイテム名
     * @param itemLabel アイテムラベル
     * @param minLen 最小桁数（-1 : チェックしない）
     * @param maxLen 最大桁数（-1 : チェックしない）
     */
    public LengthValidator(String itemName, LabelCode itemLabel, int minLen, int maxLen) {
        this(itemName, itemLabel, minLen, maxLen, true);
    }

    /**
     * コンストラクタ
     *
     * @param itemName アイテム名
     * @param itemLabel アイテムラベル
     * @param minLen 最小桁数（-1 : チェックしない）
     * @param maxLen 最大桁数（-1 : チェックしない）
     * @param btyeCheck バイトチェックフラグ
     */
    public LengthValidator(String itemName, LabelCode itemLabel, int minLen, int maxLen, boolean btyeCheck) {
        super(itemName);
        // アイテム名
        this.itemName = itemName;
        this.minLen = minLen;
        this.itemLabel = itemLabel;
        this.maxLen = maxLen;
        this.btyeCheck = btyeCheck;
    }

    private boolean isNg(BaseForm e) {
        String value = ReflectUtil.getFieldStringValue(e, this.itemName);
        // NULL許容
        if (value == null) {
            return false;
        }
        // 桁数
        int valueLen = (this.btyeCheck) ? value.getBytes().length : value.length();

        if (this.minLen != -1 && valueLen < this.minLen) {
            return true;
        }
        if (this.maxLen != -1 && valueLen > this.maxLen) {
            return true;
        }

        return false;
    }

    private I18nMessage getErrorMessage(I18nMessageAccessor accessor, Locale locale) {
        if (this.errMsg == null) {
            String i18nItemName = accessor.getMessage(itemLabel, locale);
            // 固定桁数チェックの場合
            if (this.minLen == this.maxLen) {
                // {0}は{1}桁を入力して下さい。
                Object[] params = new Object[]{i18nItemName, this.minLen};
                this.errMsg = new I18nMessage(accessor, locale, MessageCode.UNKNOW, params);
            } else if (this.minLen != -1) {
                if (this.maxLen == -1) {
                    // {0}は{1}桁以上を入力して下さい。
                    Object[] params = new Object[]{i18nItemName, this.minLen};
                    this.errMsg = new I18nMessage(accessor, locale, MessageCode.UNKNOW, params);
                } else {
                    Object[] params = new Object[]{i18nItemName, this.minLen, this.maxLen};
                    this.errMsg = new I18nMessage(accessor, locale, MessageCode.UNKNOW, params);
                }
            } else {
                // {0}は{1}桁以下を入力して下さい。
                Object[] params = new Object[]{i18nItemName, this.maxLen};
                this.errMsg = new I18nMessage(accessor, locale, MessageCode.UNKNOW, params);
            }
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
        sb.append("new LengthValidator(");
        sb.append("\"" + StringEscapeUtils.escapeEcmaScript(this.itemName) + "\", ");
        sb.append(String.valueOf(this.minLen) + ", ");
        sb.append(String.valueOf(this.maxLen) + ", ");
        String text = getErrorMessage(accessor, locale).getText();
        sb.append("\"" + StringEscapeUtils.escapeEcmaScript(text) + "\", ");
        sb.append((this.btyeCheck ? "true" : "false") + ")");
        sb.append(");");
        return sb;
    }
}
