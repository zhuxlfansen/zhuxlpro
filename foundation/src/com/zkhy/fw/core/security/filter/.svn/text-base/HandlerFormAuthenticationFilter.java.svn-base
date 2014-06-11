package com.zkhy.fw.core.security.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

import com.zkhy.fw.core.token.ExtendedUsernamePasswordToken;

/**
 * セキュリティ
 */
public class HandlerFormAuthenticationFilter extends FormAuthenticationFilter {

    public static final String DEFAULT_KAPTCHA_PARAM = "extended";

    private String extendedParam = DEFAULT_KAPTCHA_PARAM;

    public String getExtendedParam() {
        return extendedParam;
    }

    public void setExtendedParam(String extendedParam) {
        this.extendedParam = extendedParam;
    }

    protected String getExtended(ServletRequest request) {
        return WebUtils.getCleanParam(request, extendedParam);
    }

    @Override
    protected AuthenticationToken createToken(ServletRequest request, ServletResponse response) {
        String username = getUsername(request);
        String password = getPassword(request);
        String extended = getExtended(request);
        boolean rememberMe = isRememberMe(request);
        String host = getHost(request);
        return new ExtendedUsernamePasswordToken(username, password.toCharArray(), rememberMe,
                host, extended);
    }

    @Override
    protected boolean onLoginFailure(AuthenticationToken token, AuthenticationException e, ServletRequest request,
        ServletResponse response) {
        return super.onLoginFailure(token, e, request, response);
    }

    @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request,
        ServletResponse response) throws Exception {
        return super.onLoginSuccess(token, subject, request, response);
    }

}
