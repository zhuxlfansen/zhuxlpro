package com.zkhy.fw.core.util;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zkhy.fw.core.i18n.I18nCode;
import com.zkhy.fw.core.i18n.I18nMessage;
import com.zkhy.fw.core.i18n.I18nMessageAccessor;

/**
 * ログ出力用クラス
 *
 * @author guozhiqiang
 *
 */
public class FWLogger {
    /**
     * ログ出力共通クラス
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(FWLogger.class.getSimpleName());

    /**
     * Locale
     */
    private Locale locale = Locale.ROOT;

    @Autowired
    private I18nMessageAccessor messageAccessor = null;

    /**
     * @return the messageAccessor
     */
    public final I18nMessageAccessor getMessageAccessor() {
        return messageAccessor;
    }

    /**
     * プロパティファイルからメッセージを取得する
     *
     * @param msgId メッセージID
     * @param params メッセージ置換文字列
     * @return メッセージ
     */
    private String getMessage(final I18nCode code, final Object... params) {
        return getMessageAccessor().getMessage(code, params, locale);
    }

    /**
     * DEBUG レベルのメッセージを出力する
     *
     * @param param 出力する文言
     */
    public void debug(final String param) {
        LOGGER.debug(param);
    }

    /**
     * INFO レベルのメッセージを出力する
     *
     * @param param 出力する文言
     */
    public void info(final String param) {
        LOGGER.info(param);
    }

    /**
     * INFO レベルのメッセージを出力する
     *
     * @param code MessageResourcesLogにて設定したメッセージID (例:errors.e0002)
     * @param params MessageResourcesLogにてパラメータ設定したパラメータ
     */
    public void info(final I18nCode code, final Object... params) {
        LOGGER.info(getMessage(code, params));
    }

    /**
     * WARN レベルのメッセージを出力する
     *
     * @param code MessageResourcesLogにて設定したメッセージID (例:errors.e0002)
     * @param params MessageResourcesLogにてパラメータ設定したパラメータ
     */
    public void warn(final I18nCode code, final Object... params) {
        LOGGER.warn(getMessage(code, params));
    }
    // EchonetLite 画面共通コントローラ added by zxj 2013/12/04 start
    /**
     * WARN レベルのメッセージを出力する
     *
     * @param text MessageResourcesLogにて設定したメッセージ
     */
    public void warn(String text) {
        LOGGER.warn(text);
    }
    // EchonetLite 画面共通コントローラ added by zxj 2013/12/04 end
    /**
     * ERROR レベルのメッセージを出力する
     *
     * @param t MessageResourcesLogにて設定したメッセージ
     */
    public void error(Throwable t) {
        LOGGER.error("Exception", t);
    }

    /**
     *
     * @param text MessageResourcesLogにて設定したメッセージ
     */
    public void errorText(String text) {
        LOGGER.error(text);
    }

    /**
     * ERROR レベルのメッセージを出力する
     *
     * @param code MessageResourcesLogにて設定したメッセージID (例:errors.e0002)
     * @param params MessageResourcesLogにてパラメータ設定したパラメータ
     */
    public void error(final I18nCode code, final Object... params) {
        LOGGER.error(getMessage(code, params));
    }

    /**
     * StackTrace 付きで、ERROR レベルのメッセージを出力する
     *
     * @param msgId MessageResourcesLogにて設定したメッセージID (例:errors.e0002)
     * @param t StackTrace 対象の Throwable オブジェクト
     * @param params MessageResourcesLogにてパラメータ設定したパラメータ
     */
    public void error(final I18nCode msgId, final Throwable t, final Object... params) {
        LOGGER.error(getMessage(msgId, params), t);
    }

    /**
     * StackTrace 付きで、ERROR レベルのメッセージを出力する
     *
     * @param msgtext MessageResourcesLogにて設定したメッセージ
     * @param t StackTrace 対象の Throwable オブジェクト
     */
    public void errorText(final String msgtext, final Throwable t) {
        LOGGER.error(msgtext, t);
    }

    /**
     * FATAL レベルのメッセージを出力する
     *
     * @param msgId MessageResourcesLogにて設定したメッセージID (例:errors.e0002)
     * @param params MessageResourcesLogにてパラメータ設定したパラメータ
     */
    public void fatal(final I18nCode msgId, final Object... params) {
        LOGGER.error(getMessage(msgId, params));
    }

    /**
     * StackTrace 付きで、FATAL レベルのメッセージを出力する
     *
     * @param msgId MessageResourcesLogにて設定したメッセージID (例:errors.e0002)
     * @param t StackTrace 対象の Throwable オブジェクト
     * @param params MessageResourcesLogにてパラメータ設定したパラメータ
     */
    public void fatal(final I18nCode msgId, final Throwable t, final Object... params) {
        LOGGER.error(getMessage(msgId, params), t);
    }

    /**
     * StackTrace 付きで、FATAL レベルのメッセージを出力する
     *
     * @param msgText MessageResourcesLogにて設定したメッセージ
     * @param t StackTrace 対象の Throwable オブジェクト
     */
    public void fatalText(final String msgText, final Throwable t) {
        LOGGER.error(msgText, t);
    }

    /**
     *
     * @param form I18nMessage
     * @param t Throwable
     */
    public void fatalText(final I18nMessage form, final Throwable t) {
        LOGGER.error(form.getText(), t);
    }
}