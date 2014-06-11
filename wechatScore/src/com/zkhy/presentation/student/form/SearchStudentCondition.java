//******************************************************************************
// Copyright (C) 2014 中科瀚云, All Rights Reserved.
//******************************************************************************
package com.zkhy.presentation.student.form;

/**
 * @author yujie
 *
 */
public class SearchStudentCondition {

	/**
	 * id
	 */
	private String searchStuId;
	
	/**
	 * 学生姓名
	 */
	private String searchStuName;
	
	/**
	 * 年级
	 */
	private String searchStuGrade;
		
	/**
	 * 班级
	 */
	private String searchStuClass;
	
	/**
	 * 当前页数
	 */
	private int curPage = 0;
	
	/**
	 * 显示件数
	 */
	private int pageSize;
	
	/**
	 * 起始数
	 */
	private int offset;
	
	public int getOffset() {
		offset = 0;
		if (curPage > 0) {
			offset = (curPage - 1) * pageSize;
		}
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public String getSearchStuId() {
		return searchStuId;
	}

	public void setSearchStuId(String searchStuId) {
		this.searchStuId = searchStuId;
	}

	public String getSearchStuName() {
		return searchStuName;
	}

	public void setSearchStuName(String searchStuName) {
		this.searchStuName = searchStuName;
	}

	public String getSearchStuGrade() {
		return searchStuGrade;
	}

	public void setSearchStuGrade(String searchStuGrade) {
		this.searchStuGrade = searchStuGrade;
	}

	public String getSearchStuClass() {
		return searchStuClass;
	}

	public void setSearchStuClass(String searchStuClass) {
		this.searchStuClass = searchStuClass;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
