//******************************************************************************
// Copyright (C) 2014 中科瀚云, All Rights Reserved.
//******************************************************************************
package com.zkhy.business.student;

import unis.base.util.PageResult;

import com.zkhy.presentation.student.form.SearchStudentCondition;
import com.zkhy.presentation.student.form.Student;

/**
 * @author yujie
 *
 */
public interface StudentService {

	/**
	 * 批量初始化学生账号
	 * @param sutdentArray
	 */
	void batchCreatStudent(Student[] sutdentArray);
	
	/**
	 * 根据查询条件查询学生账号
	 * @param condition 查询条件
	 * @return
	 */
	PageResult searchStudent(SearchStudentCondition condition);
	
}
