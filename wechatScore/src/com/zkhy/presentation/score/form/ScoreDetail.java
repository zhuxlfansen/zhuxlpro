package com.zkhy.presentation.score.form;

public class ScoreDetail {
	
	/**
	 * 成绩id
	 */
	private int scoreId;
	
	/**
	 * 试题类型id
	 */
	private int questionTypeId;
	
	/**
	 * 分数
	 */
	private int points;

	
	/**
	 * @return the scoreId
	 */
	public int getScoreId() {
		return scoreId;
	}

	/**
	 * @param scoreId the scoreId to set
	 */
	public void setScoreId(int scoreId) {
		this.scoreId = scoreId;
	}

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
	 * @return the points
	 */
	public int getPoints() {
		return points;
	}

	/**
	 * @param points the points to set
	 */
	public void setPoints(int points) {
		this.points = points;
	}

	
}
