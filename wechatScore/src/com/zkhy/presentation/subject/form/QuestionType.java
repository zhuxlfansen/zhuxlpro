package com.zkhy.presentation.subject.form;

/**
 * 题型类
 * @author xsg
 *
 */
public class QuestionType {

	/**
	 * id
	 */
	private int questionTypeId;
	
	/**
	 * 类型名称
	 */
	private String questionTypeName;

	/**
	 * @return the questionTypeId
	 */
	public int getQuestionTypeId() {
		return questionTypeId;
	}

	/**
	 * @param questionTypeId the questionTypeId to set
	 */
	public void setQuestionTypeId(int questionTypeId) {
		this.questionTypeId = questionTypeId;
	}

	/**
	 * @return the questionTypeName
	 */
	public String getQuestionTypeName() {
		return questionTypeName;
	}

	/**
	 * @param questionTypeName the questionTypeName to set
	 */
	public void setQuestionTypeName(String questionTypeName) {
		this.questionTypeName = questionTypeName;
	}
	
}
