package com.zkhy.web.presentation.common.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zkhy.fw.presentation.action.BaseAction;
import com.zkhy.web.core.constants.Constants;
import com.zkhy.web.core.util.CommonUtil;
import com.zkhy.web.core.util.PageDefine;
import com.zkhy.web.presentation.common.form.LoginAuthenticationInfo;
import com.zkhy.web.presentation.common.form.LoginForm;

/**
 * ログインアクション
 *
 * @author guozhiqiang
 */
@Controller
@RequestMapping(LoginAction.ACTION_BASE_URL)
public class LoginAction extends BaseAction {
    /**
     * アクションのバースURL
     */
    protected static final String ACTION_BASE_URL = "/login";

    /**
     * コンストラクタ
     */
    protected LoginAction() {
        super(ACTION_BASE_URL);
    }

    /**
     * ログインメソッド
     *
     * @return LoginURL
     */
    @RequestMapping(method = RequestMethod.GET)
    public String login(HttpServletRequest req) {
        // ログインユーザを取得する。
        LoginAuthenticationInfo info = CommonUtil.getCurrentUserInfo();
        // パスワード
        if (info != null) {
            // ログイン成功
            setRedirectUrl(req, PageDefine.Index.getUrl());
        }
        return PageDefine.Login.getUrl();
    }

    /**
     * ログイン失敗処理
     *
     * @param req HttpServletRequest
     * @param model Model
     * @return URL
     */
    @RequestMapping(method = RequestMethod.POST)
    public String fail() {
        return PageDefine.Login.getUrl();
    }

	@RequestMapping(value = "validate")
    @ResponseBody
    public String validate(HttpServletRequest req, LoginForm form) {
        if (form != null && StringUtils.isNotBlank(form.getUsername()) 
            && StringUtils.isNotBlank(form.getPassword())) {
            UsernamePasswordToken token = new UsernamePasswordToken();
            token.setUsername(form.getUsername());
            token.setPassword(form.getPassword().toCharArray());
            try {
                SecurityUtils.getSubject().login(token);
            } catch (Exception e) {
                return Constants.LOGIN_STATUS_FAILURE;
            }
            LoginAuthenticationInfo info = CommonUtil.getCurrentUserInfo();
            if (info != null) {
                return Constants.LOGIN_STATUS_SUCCESS;
            } else {
                return Constants.LOGIN_STATUS_FAILURE;
            }
        } else {
            return Constants.LOGIN_STATUS_FAILURE;
        }
    }
}
