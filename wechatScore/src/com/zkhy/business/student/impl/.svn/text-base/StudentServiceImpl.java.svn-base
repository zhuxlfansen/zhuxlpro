//******************************************************************************
// Copyright (C) 2014 中科瀚云, All Rights Reserved.
//******************************************************************************
package com.zkhy.business.student.impl;

import java.util.List;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import unis.base.util.PageResult;

import com.zkhy.business.student.StudentService;
import com.zkhy.common.constants.Constants;
import com.zkhy.integration.student.dao.StudentDao;
import com.zkhy.presentation.student.form.SearchStudentCondition;
import com.zkhy.presentation.student.form.Student;

/**
 * @author yujie
 *
 */
@Service
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentDao studentDao;

	public void batchCreatStudent(Student[] sutdentArray) {

		Student tmpStudent = null;
		String tmpPassword = "";
		// 遍历数组
		for (Student student : sutdentArray) {
			tmpStudent = studentDao.selectByPrimaryKey(student.getStuId());
			if (tmpStudent == null) {
				// 插入一条数据
				// 初始密码是学生好后6位
				tmpPassword = getTmpPassword(String.valueOf(student.getStuId()));
				// MD5加密
				SimpleHash hash = new SimpleHash("MD5", tmpPassword);
				student.setPassword(hash.toHex());
				// 账号状态
				student.setStuStatus(Constants.STUDENT_STATUS_0);
				studentDao.insert(student);

			} else {
				// 数据更新
				studentDao.updateByPrimaryKeySelective(student);
			}
		}
	}
	
	public PageResult searchStudent(SearchStudentCondition condition) {

		int count = studentDao.searchStudentCount(condition);
		List<Student> studentList = studentDao.searchStudentList(condition);

		return new PageResult(studentList, count, condition.getPageSize(),
				condition.getCurPage());
	}
	
	
	/**
	 * 取字符串后6位
	 * @param tmpStr
	 * @return
	 */
	private String getTmpPassword(String tmpStr) {
		int len = tmpStr.length();
		return tmpStr.substring(len-6);
	}
}
