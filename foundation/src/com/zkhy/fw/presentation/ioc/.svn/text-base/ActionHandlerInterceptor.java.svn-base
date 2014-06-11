//******************************************************************************
// Copyright (C) 2014 Frame, All Rights Reserved.
//******************************************************************************
package com.zkhy.fw.presentation.ioc;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.zkhy.fw.core.i18n.I18nUtil;
import com.zkhy.fw.core.util.FWLogger;

/**
 * 共通アクションInterceptor
 * @author guozhiqiang
 *
 */
public class ActionHandlerInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private transient FWLogger logger;

    /**
    *
    */
   private List<String> excludesUrl = new ArrayList<String>();

   /**
    * excludesUrlをセットする。
    * @param excludesUrl excludesUrl
    */
   public final void setExcludesUrl(List<String> excludesUrl) {
       this.excludesUrl = excludesUrl;
   }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
        if (localeResolver == null) {
            throw new IllegalStateException("No LocaleResolver found: not in a DispatcherServlet request?");
        }
        localeResolver.setLocale(request, response, I18nUtil.getLoginUserLocale());

        String servletPath = request.getServletPath();
        logger.debug("[Begin] Requset Url:[" + servletPath + "]    Action Class: [" + ((handler == null) ? "" : handler.getClass().getName()) + "]");

        if (excludesUrl != null) {
            for (String url : excludesUrl) {
                if (url != null && !StringUtils.isEmpty(url) && servletPath != null && servletPath.startsWith(url)) {
                    return true;
                }
            }
        }
        return super.preHandle(request, response, handler);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
        throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }

}
