package com.zkhy.fw.presentation.action;

import java.util.List;
import java.util.Locale;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.zkhy.web.core.constants.Constants;
import com.zkhy.fw.core.i18n.I18nCode;
import com.zkhy.fw.core.i18n.I18nContext;
import com.zkhy.fw.core.i18n.I18nMessage;
import com.zkhy.fw.core.i18n.I18nMessageAccessor;
import com.zkhy.fw.core.i18n.I18nUtil;
import com.zkhy.fw.core.util.FWLogger;
import com.zkhy.fw.presentation.form.BaseForm;
import com.zkhy.fw.presentation.validator.ValidatorBuilder;
import com.zkhy.fw.presentation.validator.ValidatorBuilderMap;

/**
 * @author guozhiqiang
 *
 */
public abstract class BaseAction {
    /**
     * アクションのベースURL
     */
    private String baseActionUrl = null;
    /**
     * ログ出力共通クラス
     */
    @Autowired
    protected transient FWLogger logger = null;

    /**
     * メッセージAccessor
     */
    @Autowired
    protected I18nMessageAccessor messageAccessor = null;

    /**
     * コンストラクタ
     *
     * @param baseActionUrl
     */
    protected BaseAction(String baseActionUrl) {
        this.baseActionUrl = baseActionUrl;
    }

    /**
     * アクションのベースURLを返却する。
     *
     * @return baseUrl
     */
    public final String getBaseActionUrl() {
        return baseActionUrl;
    }

    protected void setRedirectUrl(ServletRequest request, String url) {
        request.setAttribute(Constants.MODEL_KEY_REDIRECT, url);
    }

    /**
     * 条件チェック判断関数
     *
     * @param e チェック対象
     * @param conditionKey 条件KEY
     * @return 結果（true:チェック対象　false:チェック対象外）
     */
    public boolean isItemNeedCheck(BaseForm e, String conditionKey) {
        return true;
    }

    /**
     * Jsチェックルール自動生成
     *
     * @return Js
     */
    public final StringBuilder getAutoCreateJs() {
        // マップを取得する。
        ValidatorBuilderMap map = getValidatorBuilderMap();
        // マップがnull場合、チェック不要
        if (map == null) {
            return null;
        }

        StringBuilder sb = new StringBuilder();
        for (ValidatorBuilder builder : map.allBuilders()) {
            // ユーザの言語取得する
            Locale locale = I18nUtil.getLoginUserLocale();
            // コンテキスト作成
            I18nContext context = new I18nContext(messageAccessor, locale);
            sb.append(builder.toJsFunction(context)).append(ValidatorBuilder.JS_LINE);
        }
        return sb;
    }

    /**
     * アクションチェックルールを取得する。
     *
     * @return
     */
    protected ValidatorBuilderMap getValidatorBuilderMap() {
        return null;
    }

    /**
     * 検証チェック
     *
     * @param functionName 関数
     * @param form フォーム
     * @return エラーメッセージ
     */
    protected final List<I18nMessage> doValidate(String functionName, BaseForm form) {
        // フォーム
        if (form == null) {
            return null;
        }
        // マップを取得する。
        ValidatorBuilderMap map = getValidatorBuilderMap();
        // マップがnull場合、チェック不要
        if (map == null) {
            return null;
        }
        // チェックビルドを取得する。
        ValidatorBuilder builder = map.get(functionName);
        // ルールがない場合、チェック不要
        if (builder == null) {
            return null;
        }
        // ユーザの言語取得する
        Locale locale = I18nUtil.getLoginUserLocale();
        // コンテキスト作成
        I18nContext context = new I18nContext(messageAccessor, locale);
        // チェックを行う
        return builder.doValidate(this, form, context);
    }

    /**
     * 検証チェック
     *
     * @param form フォーム
     * @return エラーメッセージ
     */
    protected final List<I18nMessage> doValidate(BaseForm form) {
        // フォーム
        if (form == null) {
            return null;
        }
        // 検証チェック
        return doValidate(form.getClass().getSimpleName(), form);
    }

    /**
     * ラベルコード対応するラベルで、メッセージコードより、メッセージを取得する
     *
     * @param code メッセージコード
     * @param args
     */
    protected final I18nMessage getMessage(I18nCode code, Object... args) {
        // ユーザの言語を取得する
        Locale locale = I18nUtil.getLoginUserLocale();
        // ラベルコードより、ラベル名を取得する
        int length = args.length;
        Object[] i18nLabels = new String[length];
        for (int i = 0; i < length; i++) {
            if (args[i] instanceof I18nCode) {
                i18nLabels[i] = getLabelText((I18nCode) args[i], locale);
            } else {
                i18nLabels[i] = args[i];
            }
        }
        return new I18nMessage(messageAccessor, locale, code, i18nLabels);
    }

    /**
     * ラベルコード対応するラベルで、メッセージコードより、メッセージを取得する
     *
     * @param code メッセージコード
     * @param itemLabel ラベルコード
     */
    protected final I18nMessage getMessage(I18nCode code, I18nCode... itemLabel) {
        // ユーザの言語を取得する
        Locale locale = I18nUtil.getLoginUserLocale();
        // ラベルコードより、ラベル名を取得する
        int length = itemLabel.length;
        Object[] i18nLabels = new String[length];
        for (int i = 0; i < length; i++) {
            i18nLabels[i] = getLabelText(itemLabel[i], locale);
        }
        return new I18nMessage(messageAccessor, locale, code, i18nLabels);
    }

    protected final I18nMessage getMessage(I18nCode code, String[] params) {
        // ユーザの言語を取得する
        Locale locale = I18nUtil.getLoginUserLocale();
        return new I18nMessage(messageAccessor, locale, code, (Object[]) params);
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
