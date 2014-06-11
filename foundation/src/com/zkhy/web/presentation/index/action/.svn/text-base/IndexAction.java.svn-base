//******************************************************************************
// Copyright (C) 2014 Frame, All Rights Reserved.
//******************************************************************************
package com.zkhy.web.presentation.index.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zkhy.fw.presentation.action.BaseAction;
import com.zkhy.web.business.index.IndexService;
import com.zkhy.web.core.util.PageDefine;
import com.zkhy.web.presentation.index.form.IndexForm;

/**
 * @author guozhiqiang
 *
 */
@Controller
@RequestMapping(IndexAction.ACTION_BASE_URL)
public class IndexAction extends BaseAction {

    /**
     * action URL
     */
    protected static final String ACTION_BASE_URL = "/";
    
    @Autowired
    private IndexService indexService;
    
    protected IndexAction() {
        super(ACTION_BASE_URL);
    }

	@RequestMapping("")
    public String login(ModelMap model) {
	    IndexForm form = new IndexForm();
	    indexService.getTimeLine(form);
	    model.addAttribute(form);
        return PageDefine.Index.getUrl();
    }
}
