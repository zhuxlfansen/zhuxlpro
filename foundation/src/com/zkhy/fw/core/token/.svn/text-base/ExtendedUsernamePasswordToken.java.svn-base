//******************************************************************************
// Copyright (C) 2014 Frame, All Rights Reserved.
//******************************************************************************
package com.zkhy.fw.core.token;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 延長トークン
 * @author guozhiqiang
 *
 */
public class ExtendedUsernamePasswordToken extends UsernamePasswordToken {

    private static final long serialVersionUID = 4463746712614712557L;

    private String extended;

    public ExtendedUsernamePasswordToken(String username, char[] password,
        boolean rememberMe, String host, String extended) {
        super(username, password, rememberMe, host);
        this.extended = extended;
    }

    /**
     * extendedを返却する。
     *
     * @return extended
     */
    public String getExtended() {
        return extended;
    }

    /**
     * extendedをセットする。
     * @param extended extended
     */
    public void setExtended(String extended) {
        this.extended = extended;
    }


}
