//******************************************************************************
// Copyright (C) 2014 中科瀚云, All Rights Reserved.
//******************************************************************************
package com.zkhy.common.core.util;

import java.util.ArrayList;
import java.util.List;

import com.zkhy.common.bean.ListItemBean;

/**
 * @author user
 *
 */
public class ClassListObject {

	/** 班级用List */
	private static List<ListItemBean> classList = new ArrayList<ListItemBean>();

	/**
	 * 获取年纪用List
	 * 
	 * @return
	 */
	public static List<ListItemBean> getClassList() {
		return classList;
	}

	/**
	 * 初始化
	 */
	public static void setup() {
		ListItemBean itemBean = null;
		// 初始化年纪用List
		for (int i = 1; i < 10; i++) {
			itemBean = new ListItemBean();
			itemBean.setValue(String.valueOf(i));
			itemBean.setName("（"+String.valueOf(i)+"） "+ " 班");
			classList.add(itemBean);
		}
	}
}
