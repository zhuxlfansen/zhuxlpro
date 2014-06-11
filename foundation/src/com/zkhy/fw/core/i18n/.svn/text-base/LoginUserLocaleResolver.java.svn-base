package com.zkhy.fw.core.i18n;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.LocaleResolver;

import com.zkhy.fw.core.i18n.I18nUtil.I18nLang;

/**
 * ローカルResolver
 *
 * @author guozhiqiang
 *
 */
public class LoginUserLocaleResolver implements LocaleResolver {
    private Locale locale = I18nLang.DEFAULT.getLocale();

    @Override
    public Locale resolveLocale(HttpServletRequest request) {
        return this.locale;
    }

    @Override
    public void setLocale(HttpServletRequest request, HttpServletResponse response, Locale plocale) {
        this.locale = plocale;
    }

}