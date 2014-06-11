//******************************************************************************
// Copyright (C) 2014 中科瀚云, All Rights Reserved.
//******************************************************************************
package com.zkhy.integration.student.dao;

import java.util.List;

import com.zkhy.common.integration.dao.annotation.DaoMaster;
import com.zkhy.presentation.student.form.SearchStudentCondition;
import com.zkhy.presentation.student.form.Student;

/**
 * @author yujie
 * 
 */
@DaoMaster
public interface StudentDao {

	/**
	 * 插入一条数据
	 * 
	 * @param record
	 * @return
	 */
	int insert(Student record);

	/**
	 * 更新数据
	 * 
	 * @param record
	 * @return
	 */
	int updateByPrimaryKeySelective(Student record);

	/**
	 * 根据主键查询记录
	 * 
	 * @param stuId
	 * @return
	 */
	Student selectByPrimaryKey(int stuId);

	/**
	 * 根据条件查询学生
	 * @param condition 查询条件
	 * @return
	 */
	List<Student> searchStudentList(SearchStudentCondition condition);
	
	/**
	 * 根据条件查询学生总数
	 * @param condition 查询条件
	 * @return
	 */
	int searchStudentCount(SearchStudentCondition condition);
}
