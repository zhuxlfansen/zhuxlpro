package com.zkhy.web.core.util;

import java.nio.charset.Charset;

import com.zkhy.web.presentation.common.form.LoginAuthenticationInfo;
import com.zkhy.fw.core.util.FWUtil;

public final class CommonUtil {
    /**
     * ディフォルト文字集（UTF-8）
     */
    public static final Charset CHARSET_UTF8 = Charset.forName("UTF-8");

    private CommonUtil() {

    }

    /**
     * Framework提供の共通関数でセッションから、ログインユーザの情報を取得する.
     * @return ログインユーザの情報
     */
    public static LoginAuthenticationInfo getCurrentUserInfo() {
        return (LoginAuthenticationInfo)FWUtil.getCurrentAuthenticationInfo();
    }

}
