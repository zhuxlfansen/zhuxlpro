package com.zkhy.web.presentation.common.validator;

import java.util.Locale;
import java.util.regex.Matcher;

import org.apache.commons.lang3.StringEscapeUtils;

import com.zkhy.web.core.constants.LabelCode;
import com.zkhy.web.core.constants.MessageCode;
import com.zkhy.web.core.util.DateUtil.DateFormat;
import com.zkhy.fw.core.i18n.I18nContext;
import com.zkhy.fw.core.i18n.I18nMessage;
import com.zkhy.fw.core.i18n.I18nMessageAccessor;

/**
 * 日付型チェック
 *
 */
public class DateValidator extends RegexValidator {
    // エラーメッセージ
    protected I18nMessage errMsg = null;
    // 日付のフォーマット
    private DateFormat format;
    // アイテムラベル
    private LabelCode itemLabel;

    /**
     * コンストラクタ
     *
     * @param itemName アイテム名
     * @param itemLabel アイテムラベル
     * @param format フォーマット
     */
    public DateValidator(String itemName, LabelCode itemLabel, DateFormat format) {
        // 親のコンストラクタ
        super(itemName);
        // 日付のフォーマット
        this.format = format;
        this.itemLabel = itemLabel;
    }

    @Override
    protected I18nMessage getErrorMessage(I18nMessageAccessor accessor, Locale locale) {
        if (this.errMsg == null) {
            // 「国際化」ラベルを取得する
            String i18nItemName = accessor.getMessage(itemLabel, locale);
            // エラーメッセージ
            this.errMsg = new I18nMessage(accessor, locale, MessageCode.UNKNOW, i18nItemName);
        }
        return this.errMsg;
    }

    @Override
    protected String getRegex() {
        return this.format.getRegexPattern();
    }

    /**
     * グループチェック
     *
     * @param matcher
     * @return
     */
    @Override
    protected boolean isGroupMatcher(Matcher matcher, String value) {
        return this.format.parse(value) != null;
    }

    @Override
    protected StringBuilder toJsRule(I18nContext context) {
        I18nMessageAccessor accessor = context.getMessageSource();
        Locale locale = context.getLocale();
        StringBuilder sb = new StringBuilder();
        sb.append(BUILDER_VAR).append(".add(");
        sb.append("new DateValidator(");

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
}
