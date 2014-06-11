//******************************************************************************
// Copyright (C) 2014 中科瀚云, All Rights Reserved.
//******************************************************************************
package com.zkhy.presentation.score.form;

import java.io.Serializable;

/**
 * @author yujie
 *
 */
public class InputScore implements Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 5495499272716539897L;
	
	/** 学号 */
	private int sutId;
	
	/** 成绩 */
	private int score;
	
	/** 成绩详细 */
	private ScoreDetail[] scoreDetail;

	public int getSutId() {
		return sutId;
	}

	public void setSutId(int sutId) {
		this.sutId = sutId;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public ScoreDetail[] getScoreDetail() {
		return scoreDetail;
	}

	public void setScoreDetail(ScoreDetail[] scoreDetail) {
		this.scoreDetail = scoreDetail;
	}
}
