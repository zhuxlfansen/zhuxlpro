package com.zkhy.fw.core.i18n;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.zkhy.fw.core.security.Authenticatable;
import com.zkhy.fw.core.util.FWUtil;

/**
 * 多语言Util
 *
 * @author guozhiqiang
 *
 */
public final class I18nUtil {
    private I18nUtil() {
    }
    /**
     * 从request中获取Locale
     *
     * @param request 请求
     * @return 语言Locale
     */
    public static Locale getRequestLocal(HttpServletRequest request) {
        LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
        if (localeResolver == null) {
            return I18nLang.DEFAULT.getLocale();
        }
        return localeResolver.resolveLocale(request);
    }

    /**
     * 获取登录用户的Locale
     *
     * @return 语言Locale
     */
    public static Locale getLoginUserLocale() {
        // 用户信息
        Authenticatable info = FWUtil.getCurrentAuthenticationInfo();
        if (info != null) {
            return info.getI18nLanguage().getLocale();
        }
        return I18nLang.DEFAULT.getLocale();
    }

    /**
     * 国际化语言定义ENUM
     *
     * @author CTC
     */
    public enum I18nLang {
        /** 英語 */
        EN("0", Locale.ENGLISH),
        /** 日语*/
        JP("1", Locale.JAPANESE),
        /** 中文 */
        CN("2", Locale.CHINESE),
        /** 韩语 */
        KR("3", Locale.KOREAN),
        /** 默认：中文 */
        DEFAULT("", CN.getLocale());

        private String langCode = null;
        private Locale locale = null;

        private I18nLang(String langCode, Locale locale) {
            this.langCode = langCode;
            this.locale = locale;
        }

        /**
         * @return the suffix
         */
        public Locale getLocale() {
            return this.locale;
        }

        /**
         * @return the langCode
         */
        public String getLangCode() {
            return this.langCode;
        }

        /**
         * 根据语言code获取语言Locale
         *
         * @param langCode 语言code
         * @return 语言Locale
         */
        public static I18nLang getByCode(String langCode) {
            for (I18nLang item : I18nLang.values()) {
                if (item.getLangCode().equals(langCode)) {
                    return item;
                }
            }
            // 默认值
            return DEFAULT;
        }
    }
}