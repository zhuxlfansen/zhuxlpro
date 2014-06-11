package com.zkhy.web.presentation.common.validator;

import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;

import com.zkhy.web.core.util.ReflectUtil;
import com.zkhy.fw.core.i18n.I18nContext;
import com.zkhy.fw.core.i18n.I18nMessage;
import com.zkhy.fw.core.i18n.I18nMessageAccessor;
import com.zkhy.fw.presentation.form.BaseForm;
import com.zkhy.fw.presentation.validator.AbstractValidator;

/**
 * 正規表現を利用できるValidator
 *
 * @author kxiong
 */
public abstract class RegexValidator extends AbstractValidator {
    /**
     * アイテム名
     */
    protected String itemName;

    /**
     * ブランク許容フラグ
     */
    private boolean allowBlank = true;

    /**
     * EMPTY許容フラグ
     */
    private boolean allowEmpty = true;

    /**
     * 右TRIMフラグ
     */
    private boolean needTrimRight = true;

    /**
     * コンストラクタ
     *
     * @param itemName アイテム名
     */
    public RegexValidator(String itemName) {
        super(itemName);
        // アイテム名
        this.itemName = itemName;
    }

    /**
     * ストリング値を取得する。
     *
     * @param e
     * @return
     */
    protected String getStringValue(BaseForm e) {
        Object value = ReflectUtil.getFieldValue(e, this.itemName);
        if (value == null) {
            return null;
        }
        return String.valueOf(value);
    }

    /**
     * 正規表現を取得する。
     *
     * @return
     */
    protected abstract String getRegex();

    /**
     * エラーメッセージを取得する。
     *
     * @return
     */
    protected abstract I18nMessage getErrorMessage(I18nMessageAccessor accessor, Locale locale);

    /**
     * グループチェック
     *
     * @param matcher
     * @return
     */
    protected boolean isGroupMatcher(Matcher matcher, String value) {
        return true;
    }

    /**
     * チェックを行う
     *
     * @param e BaseForm
     * @param context I18nContext
     * @return エラーメッセージ
     */
    @Override
    public I18nMessage validate(BaseForm e, I18nContext context) {
        I18nMessageAccessor accessor = context.getMessageSource();
        Locale locale = context.getLocale();
        // ストリング値を取得する
        String value = this.getStringValue(e);
        // EMPTY許容
        if (StringUtils.isEmpty(value)) {
            return isAllowEmpty() ? null : getErrorMessage(accessor, locale);
        }
        // ブランク許容
        if (StringUtils.isBlank(value)) {
            return isAllowBlank() ? null : getErrorMessage(accessor, locale);
        }

        // 右TRIMフラグ
        if (isNeedTrimRight()) {
            value = value.replaceFirst("\\s+$", "");
        }

        // パターン作成
        Pattern pattern = Pattern.compile(getRegex());
        // Matcher作成
        Matcher matcher = pattern.matcher(value);
        //
        if (!matcher.matches() || !isGroupMatcher(matcher, value)) {
            return getErrorMessage(accessor, locale);
        }
        return null;
    }

    @Override
    protected StringBuilder toJsRule(I18nContext context) {
        I18nMessageAccessor accessor = context.getMessageSource();
        Locale locale = context.getLocale();

        StringBuilder sb = new StringBuilder();
        sb.append(BUILDER_VAR).append(".add(");
        sb.append("new RegexValidator(");

        // パラメータ１：正規表現
        sb.append("\"" + StringEscapeUtils.escapeEcmaScript(getRegex()) + "\",");
        // パラメータ２：アイテムID or Name
        sb.append("\"" + StringEscapeUtils.escapeEcmaScript(this.itemName) + "\", ");
        // パラメータ３：エラーメッセージ
        String text = getErrorMessage(accessor, locale).getText();
        sb.append("\"" + StringEscapeUtils.escapeEcmaScript(text) + "\")");

        sb.append(");");
        return sb;
    }

    /**
     * ブランク許容フラグを取得する。
     *
     * @return フラグ
     */
    public boolean isAllowBlank() {
        return allowBlank;
    }

    /**
     * ブランク許容フラグを設定する。
     *
     * @param allowBlank フラグ
     */
    public void setAllowBlank(boolean allowBlank) {
        this.allowBlank = allowBlank;
    }

    /**
     * 空許容フラグを取得する。
     * @return フラグ
     */
    public boolean isAllowEmpty() {
        return this.allowEmpty;
    }

    /**
     * ブランク許容フラグを設定する。
     * @param allowEmpty フラグ
     */
    public void setAllowEmpty(boolean allowEmpty) {
        this.allowEmpty = allowEmpty;
    }

    /**
     * 右Trim必要フラグを取得する。
     * @return フラグ
     */
    public boolean isNeedTrimRight() {
        return this.needTrimRight;
    }

    /**
     * 右Trim必要フラグを設定する。
     * @param needTrimRight フラグ
     */
    public void setNeedTrimRight(boolean needTrimRight) {
        this.needTrimRight = needTrimRight;
    }
}
