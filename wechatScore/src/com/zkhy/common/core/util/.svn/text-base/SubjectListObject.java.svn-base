//******************************************************************************
// Copyright (C) 2014 中科瀚云, All Rights Reserved.
//******************************************************************************
package com.zkhy.common.core.util;

import java.util.ArrayList;
import java.util.List;

import com.zkhy.business.subject.SubjectService;
import com.zkhy.presentation.subject.form.Subject;

/**
 * @author yujie
 *
 */
public class SubjectListObject {
	
	/** 科目用service */
	private static SubjectService subjectService = null;

	/** 科目用List */
	private static List<Subject> subjectList = new ArrayList<Subject>();
	
	/**
	 * 设置service
	 * @param service
	 */
	public static void setSubjectService(SubjectService service) {
		SubjectListObject.subjectService = service;
	}
	
	/**
	 * 取得科目用List
	 * @return
	 */
	public static List<Subject> getSubjectList() {
		return SubjectListObject.subjectList;
	}
	
	/**
	 * 初始化 
	 */
	public static void setup() {
		subjectList = subjectService.getAllSubject();
	}
}
