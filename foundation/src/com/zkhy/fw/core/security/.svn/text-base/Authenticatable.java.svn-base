package com.zkhy.fw.core.security;

import java.io.Serializable;

import com.zkhy.fw.core.i18n.I18nUtil.I18nLang;

/**
 * 登录用户信息
 *
 * @author guozhiqiang
 *
 */
public interface Authenticatable extends Serializable {
    /**
     * 用户信息
     * @return
     */
    Object getCredentials();
    /**
     * userIDを返却する。
     *
     * @return userID
     */
    String getUserID();

    /**
     * userPassを返却する。
     *
     * @return userPass
     */
    String getPassword();

    /**
     * userNameを返却する。
     *
     * @return userName
     */
    String getUserName();

    /**
     * i18nLanguageを返却する。
     *
     * @return i18nLanguage
     */
    I18nLang getI18nLanguage();
}
