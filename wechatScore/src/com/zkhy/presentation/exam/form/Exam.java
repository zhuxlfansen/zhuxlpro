package com.zkhy.presentation.exam.form;

import java.util.Date;

/**
 * 考试类
 * @author xsg
 *
 */
public class Exam {
	
	/**
	 * id
	 */
	private int examId;
	
	/**
	 * 考试名称
	 */
	private String examName;
	
	/**
	 * 考试日期
	 */
	private Date examDate;
	
	/**
	 * 考试说明
	 */
	private String examExpl;

	/**
	 * @return the examId
	 */
	public int getExamId() {
		return examId;
	}

	/**
	 * @param examId the examId to set
	 */
	public void setExamId(int examId) {
		this.examId = examId;
	}

	/**
	 * @return the examName
	 */
	public String getExamName() {
		return examName;
	}

	/**
	 * @param examName the examName to set
	 */
	public void setExamName(String examName) {
		this.examName = examName;
	}

	/**
	 * @return the examDate
	 */
	public Date getExamDate() {
		return examDate;
	}

	/**
	 * @param examDate the examDate to set
	 */
	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}

	/**
	 * @return the examExpl
	 */
	public String getExamExpl() {
		return examExpl;
	}

	/**
	 * @param examExpl the examExpl to set
	 */
	public void setExamExpl(String examExpl) {
		this.examExpl = examExpl;
	}
	
	
}
