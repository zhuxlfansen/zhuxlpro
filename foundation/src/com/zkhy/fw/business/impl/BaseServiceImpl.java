package com.zkhy.fw.business.impl;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;

import com.zkhy.fw.business.BaseService;
import com.zkhy.fw.core.i18n.I18nCode;
import com.zkhy.fw.core.i18n.I18nMessageAccessor;
import com.zkhy.fw.core.i18n.I18nUtil;
import com.zkhy.fw.core.util.FWLogger;

/**
 * 画面共通サービス共通クラス
 *
 * @author guozhiqiang
 */
public abstract class BaseServiceImpl implements BaseService {
    /**
     * ログ出力共通クラス
     */
    @Autowired
    protected transient FWLogger logger;

    /**
     * メッセージAccessor
     */
    @Autowired
    protected I18nMessageAccessor messageAccessor = null;

    /**
     * メッセージ文言を取得
     *
     * @param messageCd メッセージコード
     * @return メッセージ文言
     */
    public String getMessage(final I18nCode messageCd) {
        return logger.getMessageAccessor().getMessage(messageCd);
    }

    /**
     * メッセージ文言を取得
     *
     * @param messageCd メッセージコード
     * @param params メッセージパラメータ
     * @return メッセージ文言
     */
    public String getMessage(final I18nCode messageCd, final Object... params) {
        return logger.getMessageAccessor().getMessage(messageCd, params);
    }


    /**
     * ラベルコード対応するラベルより、ラベルの文字を取得する
     *
     * @param itemLabel ラベルコード
     * @param locale ユーザの言語
     * @param ラベルの文字
     */
    protected final String getLabelText(I18nCode itemLabel) {
        // ユーザの言語を取得する
        Locale locale = I18nUtil.getLoginUserLocale();
        // ラベルコード対応するラベルより、ラベルの文字を取得する
        return getLabelText(itemLabel, locale);
    }

    /**
     * ラベルコード対応するラベルより、ラベルの文字を取得する
     *
     * @param itemLabel ラベルコード
     * @param locale ユーザの言語
     * @param ラベルの文字
     */
    private String getLabelText(I18nCode itemLabel, Locale locale) {
        // ラベルコード対応するラベルより、ラベルの文字を取得する
        return messageAccessor.getMessage(itemLabel, locale);
    }
}
