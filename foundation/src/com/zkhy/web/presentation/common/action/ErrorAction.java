package com.zkhy.web.presentation.common.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zkhy.web.core.util.PageDefine;
import com.zkhy.fw.core.util.FWUtil;
import com.zkhy.fw.presentation.action.BaseAction;

/**
 * システムエラーアクション
 *
 * @author guozhiqiang
 */
@Controller
@RequestMapping(ErrorAction.ACTION_BASE_URL)
public class ErrorAction extends BaseAction {
    /**
     * アクションのバースURL
     */
    protected static final String ACTION_BASE_URL = "/error";
    /**
     * コンストラクタ
     */
    protected ErrorAction() {
        super(ACTION_BASE_URL);
    }

    /**
     * システムエラーページへ
     * @param model ModelMap
     * @param form ErrorForm
     * @param request HttpServletRequest
     * @return LoginURL
     */
    @RequestMapping("")
    public String init() {
        // ログアウト
        FWUtil.logout();
        return PageDefine.SYSTEM_ERROR.getUrl();
    }
}
