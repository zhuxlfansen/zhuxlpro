//******************************************************************************
// Copyright (C) 2014 中科瀚云, All Rights Reserved.
//******************************************************************************
package com.zkhy.presentation.student.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import unis.base.util.PageResult;

import com.zkhy.business.student.StudentService;
import com.zkhy.common.bean.ListItemBean;
import com.zkhy.common.constants.MessageCode;
import com.zkhy.common.core.i18n.I18nMessage;
import com.zkhy.common.core.util.ClassListObject;
import com.zkhy.presentation.common.action.BaseAction;
import com.zkhy.presentation.response.body.JsonResponseBody;
import com.zkhy.presentation.response.body.JsonResponseBody.JsonStatus;
import com.zkhy.presentation.student.form.SearchStudentCondition;
import com.zkhy.presentation.student.form.Student;

/**
 * @author yujie
 * 
 */
@Controller
@RequestMapping("/student")
public class StudentAction extends BaseAction {
	
	@Autowired
	private StudentService studentService;

	/**
	 * 画面初始化
	 * 
	 * @param model
	 *            model
	 * @return 画面Jsp
	 */
	@RequestMapping("/init")
	public String init(ModelMap model) {

		// 初始化班级用List
		List<ListItemBean> classList = ClassListObject.getClassList();

		model.addAttribute("classList", classList);

		return "creatStudent";
	}
	
	/**
	 * 批量初始化学生账号
	 * @param studentArray
	 */
	@ResponseBody
	@RequestMapping("/creatStudent")
	public JsonResponseBody creatStudent(@RequestBody Student[] studentArray) {

		// 批量初始学生账号
		studentService.batchCreatStudent(studentArray);

		JsonResponseBody resBody = new JsonResponseBody();
		resBody.setStatus(JsonStatus.OK);
		I18nMessage msg = new I18nMessage(messageAccessor, MessageCode.I000001);
		resBody.addMessage(msg);
		return resBody;
	}
	
	@ResponseBody
	@RequestMapping("/searchStudent")
	public PageResult searchStudent(SearchStudentCondition searchConditon) {

		PageResult result = studentService.searchStudent(searchConditon);

		return result;

	}

	/**
	 * 下载上传模板
	 * 
	 * @param response
	 *            httpResponse
	 * @throws Exception
	 */
//	@ResponseBody
//	@RequestMapping("/downLoadExcelModel")
//	public void downLoadExcelModel(HttpServletRequest request,
//			HttpServletResponse response) throws Exception {
//		// 真实路径
//		String path = request.getSession().getServletContext()
//				.getRealPath("/static");
//		// 文件名
//		String fileName = "上传学生账号模板.xls";
//
//		String filePath = path + "\\" + fileName;
//
//		ExcelUtil.downLoadFile(filePath, response, fileName, "xls");
//	}

//	@RequestMapping("/uploadExcel")
//	public String uploadStudentInfo(
//			@RequestParam(value = "excelFile") MultipartFile excelFile,
//			String uploadGrade, String uploadClass, ModelMap model) {
//
//		String fileType = "";
//		String fileName = excelFile.getOriginalFilename();
//		fileType = FilenameUtils.getExtension(fileName);
//
//		if (!fileType.toLowerCase().equals("xls")) {
//			this.addMessage(model, new I18nMessage(messageAccessor,
//					MessageCode.E000083));
//		}
//
//		HSSFWorkbook wb = null;
//		try {
//			wb = new HSSFWorkbook(excelFile.getInputStream());
//			// 取第一个Sheet
//			HSSFSheet sheet = wb.getSheetAt(0);
//			
//			// 遍历每一行数据
//			for (int i = sheet.getFirstRowNum(); i <= sheet.getLastRowNum(); i++) {
//
//				// 第一行为标题，跳过
//				if (i == 0) {
//					continue;
//				}
//
//				HSSFRow row = sheet.getRow(i);
//				Iterator cells = row.cellIterator();
//				// 遍历每一列数据
//				while (cells.hasNext()) {
//					HSSFCell cell = (HSSFCell) cells.next();
//				}
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//
//		return "";
//	}
}
