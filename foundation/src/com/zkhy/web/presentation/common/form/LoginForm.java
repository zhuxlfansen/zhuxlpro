//******************************************************************************
// Copyright (C) 2014 中科瀚云, All Rights Reserved.
//******************************************************************************
package com.zkhy.web.presentation.common.form;

import com.zkhy.fw.presentation.form.BaseForm;

/**
 * @author guozhiqiang
 *
 */
public class LoginForm extends BaseForm {

    private static final long serialVersionUID = -1537070245785779504L;
 
    private String username;
    private String password;
    /**
     * usernameを返却する。
     *
     * @return username
     */
    public String getUsername() {
        return username;
    }
    /**
     * usernameをセットする。
     * @param username username
     */
    public void setUsername(String username) {
        this.username = username;
    }
    /**
     * passwordを返却する。
     *
     * @return password
     */
    public String getPassword() {
        return password;
    }
    /**
     * passwordをセットする。
     * @param password password
     */
    public void setPassword(String password) {
        this.password = password;
    }
    
}
