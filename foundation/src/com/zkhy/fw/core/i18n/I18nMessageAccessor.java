package com.zkhy.fw.core.i18n;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;

/**
 * メッセージ取得用クラス
 *
 * @author guozhiqiang
 *
 */
public class I18nMessageAccessor {
    @Autowired
    private MessageSource messageSource;

    /**
     * Return the default locale to use if no explicit locale has been given.
     * <p>
     * The default implementation returns the default locale passed into the corresponding constructor, or
     * LocaleContextHolder's locale as fallback. Can be overridden in subclasses.
     *
     * @see #MessageSourceAccessor(org.springframework.context.MessageSource, java.util.Locale)
     * @see org.springframework.context.i18n.LocaleContextHolder#getLocale()
     */
    protected Locale getDefaultLocale() {
        return LocaleContextHolder.getLocale();
    }

    /**
     * Retrieve the message for the given code and the default Locale.
     *
     * @param code code of the message
     * @param defaultMessage String to return if the lookup fails
     * @return the message
     */
    public String getMessage(I18nCode code, String defaultMessage) {
        return this.messageSource.getMessage(code.getCode(), null, defaultMessage, getDefaultLocale());
    }

    /**
     * Retrieve the message for the given code and the given Locale.
     *
     * @param code code of the message
     * @param defaultMessage String to return if the lookup fails
     * @param locale Locale in which to do lookup
     * @return the message
     */
    public String getMessage(I18nCode code, String defaultMessage, Locale locale) {
        return this.messageSource.getMessage(code.getCode(), null, defaultMessage, locale);
    }

    /**
     * Retrieve the message for the given code and the default Locale.
     *
     * @param code code of the message
     * @param args arguments for the message, or <code>null</code> if none
     * @param defaultMessage String to return if the lookup fails
     * @return the message
     */
    public String getMessage(I18nCode code, Object[] args, String defaultMessage) {
        return this.messageSource.getMessage(code.getCode(), args, defaultMessage, getDefaultLocale());
    }

    /**
     * Retrieve the message for the given code and the given Locale.
     *
     * @param code code of the message
     * @param args arguments for the message, or <code>null</code> if none
     * @param defaultMessage String to return if the lookup fails
     * @param locale Locale in which to do lookup
     * @return the message
     */
    public String getMessage(I18nCode code, Object[] args, String defaultMessage, Locale locale) {
        return this.messageSource.getMessage(code.getCode(), args, defaultMessage, locale);
    }

    /**
     * Retrieve the message for the given code and the default Locale.
     *
     * @param code code of the message
     * @return the message
     */
    public String getMessage(I18nCode code) {
        return this.messageSource.getMessage(code.getCode(), null, getDefaultLocale());
    }

    /**
     * Retrieve the message for the given code and the given Locale.
     *
     * @param code code of the message
     * @param locale Locale in which to do lookup
     * @return the message
     */
    public String getMessage(I18nCode code, Locale locale) {
        return this.messageSource.getMessage(code.getCode(), null, locale);
    }

    /**
     * Retrieve the message for the given code and the default Locale.
     *
     * @param code code of the message
     * @param args arguments for the message, or <code>null</code> if none
     * @return the message
     */
    public String getMessage(I18nCode code, Object[] args) {
        return this.messageSource.getMessage(code.getCode(), args, getDefaultLocale());
    }

    /**
     * Retrieve the message for the given code and the given Locale.
     *
     * @param code code of the message
     * @param args arguments for the message, or <code>null</code> if none
     * @param locale Locale in which to do lookup
     * @return the message
     */
    public String getMessage(I18nCode code, Object[] args, Locale locale) {
        return this.messageSource.getMessage(code.getCode(), args, locale);
    }
}
