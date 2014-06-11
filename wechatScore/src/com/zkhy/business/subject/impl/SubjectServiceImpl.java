//******************************************************************************
// Copyright (C) 2014 中科瀚云, All Rights Reserved.
//******************************************************************************
package com.zkhy.business.subject.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zkhy.business.subject.SubjectService;
import com.zkhy.integration.subject.dao.QuestionTypeDao;
import com.zkhy.integration.subject.dao.SubjectDao;
import com.zkhy.presentation.subject.form.QuestionType;
import com.zkhy.presentation.subject.form.Subject;

/**
 * @author user
 *
 */
@Service
public class SubjectServiceImpl implements SubjectService {

	@Autowired
	private SubjectDao subjectDao;
	
	@Autowired
	private QuestionTypeDao questionTypeDao;

	@Override
	public List<Subject> getAllSubject() {
		return subjectDao.searchAllSubject();
	}

	@Override
	public List<QuestionType> getQuestionTyp(int subjectId) {
		return questionTypeDao.searchBySubjectId(subjectId);
	}
	
	
}
