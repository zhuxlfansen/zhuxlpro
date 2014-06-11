//******************************************************************************
// Copyright (C) 2014 中科瀚云, All Rights Reserved.
//******************************************************************************
package com.zkhy.web.business.index;

import com.zkhy.fw.business.BaseService;
import com.zkhy.web.presentation.index.form.IndexForm;

/**
 * @author guozhiqiang
 *
 */
public interface IndexService extends BaseService {
    /**
     * 获取时间轴信息
     * @param form IndexForm
     */
    void getTimeLine(IndexForm form);
}
