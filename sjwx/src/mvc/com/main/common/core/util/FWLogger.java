package mvc.com.main.common.core.util;

import java.util.Locale;

import mvc.com.main.common.core.i18n.I18nCode;
import mvc.com.main.common.core.i18n.I18nMessage;
import mvc.com.main.common.core.i18n.I18nMessageAccessor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;


/**
 * @author yujie
 *
 */
public class FWLogger {

	/**
     * 通用日志输出�?
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
     * 根据ID取出message
     *
     * @param msgId messageID
     * @param params message参数
     * @return message
     */
    private String getMessage(final I18nCode code, final Object... params) {
        return getMessageAccessor().getMessage(code, params, locale);
    }

    /**
     * DEBUG message输出
     *
     * @param param 输出内容
     */
    public void debug(final String param) {
        LOGGER.debug(param);
    }

    /**
     * INFO message输出
     *
     * @param param 输出内容
     */
    public void info(final String param) {
        LOGGER.info(param);
    }

    /**
     * INFO message输出
     *
     * @param code MessageResourcesLog中设定的messageCode (�?errors.e0002)
     * @param params MessageResourcesLog中设定的message参数
     */
    public void info(final I18nCode code, final Object... params) {
        LOGGER.info(getMessage(code, params));
    }

    /**
     * WARN message输出
     *
     *  @param code MessageResourcesLog中设定的messageCode (�?errors.e0002)
     * @param params MessageResourcesLog中设定的message参数
     */
    public void warn(final I18nCode code, final Object... params) {
        LOGGER.warn(getMessage(code, params));
    }

    /**
     * ERROR message输出
     *
     * @param t 抛出例外
     */
    public void error(Throwable t) {
        LOGGER.error("Exception", t);
    }

    /**
     * ERROR message输出
     * @param text 内容
     */
    public void errorText(String text) {
        LOGGER.error(text);
    }

    /**
     * ERROR message输出
     *
     * @param code MessageResourcesLog中设定的messageCode (�?errors.e0002)
     * @param params MessageResourcesLog中设定的message参数
     */
    public void error(final I18nCode code, final Object... params) {
        LOGGER.error(getMessage(code, params));
    }

    /**
     * 带StackTrace的ERROR message输出
     *
     * @param msgId MessageResourcesLog中设定的messageCode (�?errors.e0002)
     * @param t StackTrace 对象的Throwable Object
     * @param params MessageResourcesLog中设定的message参数
     */
    public void error(final I18nCode msgId, final Throwable t, final Object... params) {
        LOGGER.error(getMessage(msgId, params), t);
    }

    /**
     * 带StackTrace的ERROR message输出
     *
     * @param msgId MessageResourcesLog中设定的messageCode (�?errors.e0002)
     * @param t StackTrace 对象的Throwable Object
     */
    public void errorText(final String msgtext, final Throwable t) {
        LOGGER.error(msgtext, t);
    }

    /**
     * FATAL message输出
     *
     * @param msgId MessageResourcesLog中设定的messageCode (�?errors.e0002)
     * @param params MessageResourcesLog中设定的message参数
     */
    public void fatal(final I18nCode msgId, final Object... params) {
        LOGGER.error(getMessage(msgId, params));
    }

    /**
     * 带StackTrace的FATAL message输出
     *
     * @param msgId MessageResourcesLog中设定的messageCode (�?errors.e0002)
     * @param t StackTrace 对象的Throwable Object
     * @param params MessageResourcesLog中设定的message参数
     */
    public void fatal(final I18nCode msgId, final Throwable t, final Object... params) {
        LOGGER.error(getMessage(msgId, params), t);
    }

    /**
     * 带StackTrace的FATAL message输出
     *
     * @param msgText MessageResourcesLog中设定的message内容
     * @param t StackTrace 对象的Throwable Object
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
