package ustc.yzwx.presentation.student.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ustc.yzwx.business.partakeRecord.PartakeRecordService;
import ustc.yzwx.business.student.StudentService;
import ustc.yzwx.presentation.partakeRecord.form.PartakeRecord;
import ustc.yzwx.presentation.student.form.Student;

/**
 * 考生详情Action
 * @author zcy
 * @version 1.0.0 2014-2-18
 */

@Controller
@RequestMapping("/student")
public class StudentDetailAction {

	/**
	 * Spring 注入的studentServiece对象
	 */
	@Autowired
	private StudentService studentServiece;
	
	/**
	 * Spring 注入的PartakeRecordService对象
	 */
	@Autowired
	private PartakeRecordService partakeRecordService;

	/**
	 * 考生详情初始界面
	 * @param model
	 * @return string:studentDetail
	 */
	@RequestMapping("/init")
	public String init(ModelMap model) {

		return "studentDetail";
	}

	/**
	 * 考生详情
	 * @param id
	 * @param model
	 * @return string:studentDetail
	 */
	@RequestMapping("/detail")
	public String findById(int id ,Model model) {
		
		// 根据ID查询
		Student student = studentServiece.selectByPrimaryKey(id);
		
		// 判断用户是否为空
		if(student != null){
			model.addAttribute(student);
			
			// 取出考生参加的活动
			List<PartakeRecord> partakeRecordList = partakeRecordService.selectByStudentId(id);
			model.addAttribute("partakeRecordList", partakeRecordList);
		}
		
		return "studentDetail";
	}
	
	@ResponseBody
	@RequestMapping("/loadGpaImg")
	public String loadGpaImg(int id ,HttpServletResponse response) {
		// ..
		ServletOutputStream sout;
		// 根据ID查询
		Student student = studentServiece.selectByPrimaryKey(id);
		
		// 二进制文件写到输出流
		response.setContentType("image/jpeg");
		response.setHeader("Cache-control", "no-cache ");
		
		try {
			sout = response.getOutputStream();
			sout.write(student.getGpaImg());
			sout.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
