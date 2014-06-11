//******************************************************************************
// Copyright (C) 2014 中科瀚云, All Rights Reserved.
//******************************************************************************
package com.zkhy.presentation.score.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zkhy.business.subject.SubjectService;
import com.zkhy.common.core.util.SubjectListObject;
import com.zkhy.presentation.common.action.BaseAction;
import com.zkhy.presentation.response.body.JsonResponseBody;
import com.zkhy.presentation.score.form.InputScore;
import com.zkhy.presentation.subject.form.QuestionType;
import com.zkhy.presentation.subject.form.Subject;

/**
 * @author yujie
 *
 */
@Controller
@RequestMapping("/score")
public class InputScoreAction extends BaseAction {
	
	@Autowired
	private SubjectService subjectService;

	/**
	 * 画面初始化
	 * @param model
	 * @return
	 */
	@RequestMapping("/init")
	public String init(ModelMap model) {
		// 初始化科目用List
		List<Subject> subjectList = SubjectListObject.getSubjectList();
		model.addAttribute("subjectList", subjectList);
		
		return "inputScore";
	}
	
	/**
	 * 获取题目类型
	 * @param subjectId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getQuestionType")
	public List<QuestionType> getQuestionType(int subjectId) {
		return subjectService.getQuestionTyp(subjectId);
	}
	
	@ResponseBody
	@RequestMapping("/inputScore")
	public JsonResponseBody inputScore(
			@RequestParam(value = "inputScore") InputScore[] inputScore,
			@RequestParam(value = "examName") String examName,
			@RequestParam(value = "selectSubject") int subjectId) {

		return null;
	}
}
