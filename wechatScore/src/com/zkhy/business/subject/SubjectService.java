//******************************************************************************
// Copyright (C) 2014 中科瀚云, All Rights Reserved.
//******************************************************************************
package com.zkhy.business.subject;

import java.util.List;

import com.zkhy.presentation.subject.form.QuestionType;
import com.zkhy.presentation.subject.form.Subject;

/**
 * @author yujie
 *
 */
public interface SubjectService {

	/**
	 * 取得所有科目
	 * @return
	 */
	List<Subject> getAllSubject();
	
	List<QuestionType> getQuestionTyp(int subjectId);
}
