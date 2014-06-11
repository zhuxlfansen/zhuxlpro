package com.zkhy.fw.core.i18n;

import java.util.Locale;

/**
 * 国際化コンテキスト
 *
 * @author guozhiqiang
 */
public class I18nContext {
    /**
     * メッセージAccessor
     */
    private I18nMessageAccessor messageSource;

    /**
     * ローカル
     */
    private Locale locale;

    /**
     * コンストラクタ
     *
     * @param messageSource メッセージソース
     * @param locale ローカル
     */
    public I18nContext(I18nMessageAccessor messageSource, Locale locale) {
        this.messageSource = messageSource;
        this.locale = locale;
    }

    /**
     * メッセージソースを取得する。
     *
     * @return メッセージソース
     */
    public I18nMessageAccessor getMessageSource() {
        return this.messageSource;
    }

    /**
     * ローカルを取得する。
     *
     * @return ローカル
     */
    public Locale getLocale() {
        return this.locale;
    }

}