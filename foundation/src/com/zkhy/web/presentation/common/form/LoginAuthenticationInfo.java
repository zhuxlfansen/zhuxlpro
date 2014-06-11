package com.zkhy.web.presentation.common.form;

import org.apache.shiro.authc.AuthenticationToken;

import com.zkhy.fw.core.i18n.I18nUtil.I18nLang;
import com.zkhy.fw.core.security.Authenticatable;

public class LoginAuthenticationInfo implements Authenticatable {

    private static final long serialVersionUID = 5850582184160655606L;
    private AuthenticationToken token;
    // 用户ID
    private String userID;
    // 用户名
    private String userName;
    // 密码
    private String password;
    // 角色
    private String userRole;
    // 语言（默认：中文）
    private I18nLang i18nLanguage = I18nLang.DEFAULT;

    public LoginAuthenticationInfo(AuthenticationToken token) {
        this.token = token;
    }

    @Override
    public Object getCredentials() {
        return this.token.getCredentials();
    }
    
    @Override
    public String getUserID() {
        return userID;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUserName() {
        return userName;
    }

    @Override
    public I18nLang getI18nLanguage() {
        return i18nLanguage;
    }

    public AuthenticationToken getToken() {
        return token;
    }

    public void setToken(AuthenticationToken token) {
        this.token = token;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setI18nLanguage(I18nLang i18nLanguage) {
        this.i18nLanguage = i18nLanguage;
    }
    
    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

}
