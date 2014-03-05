package ustc.yzwx.presentation.student.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import ustc.yzwx.business.student.MajorService;
import ustc.yzwx.business.student.RegionService;
import ustc.yzwx.business.student.SchoolService;
import ustc.yzwx.business.student.StudentService;
import ustc.yzwx.common.constants.MessageCode;
import ustc.yzwx.common.core.i18n.I18nMessage;
import ustc.yzwx.presentation.common.action.BaseAction;
import ustc.yzwx.presentation.student.form.Major;
import ustc.yzwx.presentation.student.form.Region;
import ustc.yzwx.presentation.student.form.School;
import ustc.yzwx.presentation.student.form.Student;

/**
 * 考生注册Action
 * @author zcy
 * @version 1.0.0 2014-2-21
 */

@Controller
@RequestMapping("/student")
public class StudentLoginAction extends BaseAction{

	/**
	 * Spring 注入StudentService对象
	 */
	@Autowired
	private StudentService studentServiece;

	/**
	 * Spring 注入SchoolService对象
	 */
	@Autowired
	private SchoolService schoolService;

	/**
	 * Spring 注入MajorService对象
	 */
	@Autowired
	private MajorService majorService;

	/**
	 * Spring 注入RegionService对象
	 */
	@Autowired
	private RegionService regionService;

	/**
	 * 考生详情初始界面
	 * 
	 * @param model
	 * @return string:studentDetail
	 */
	@RequestMapping("/login")
	public String init(ModelMap model) {

		// 查出一级专业
		List<Major> parentMajorList = majorService.selectByParentCode("");
		model.addAttribute("parentMajorList", parentMajorList);

		return "studentLogin";
	}

	/**
	 * 提交考生注册信息
	 * @param student
	 * @param imgFile
	 * @return 
	 */
	@RequestMapping("/submitLogin")
	public String submitLogin(Student student, @RequestParam(value = "imgFile") MultipartFile imgFile ,ModelMap model) {
		try {
			if (!imgFile.isEmpty()) {
				byte[] bytes = imgFile.getBytes();
				student.setGpaImg(bytes);
				student.setStatus((short) 1);
				
				studentServiece.addStudent(student);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "studentLoginFail";
		}
		
		model.addAttribute("currentStudent", student);
		
		return "studentLoginSuccess";
	}

	/**
	 * 根据省份ID 获得所在学校列表
	 * 
	 * @param provinceId
	 * @return List School
	 */
	@RequestMapping("/loadSchools")
	@ResponseBody
	public List<School> loadSchools(String place) {
		Region region = regionService.selectById(Integer.parseInt(place));

		if (region != null) {
			return schoolService.selectByPlace(region.getCode());
		}

		return null;
	}

	/**
	 * 根据院系Code获得下面的专业列表
	 * 
	 * @param parentCode
	 * @return List Major
	 */
	@RequestMapping("/loadMajors")
	@ResponseBody
	public List<Major> loadMajors(String parentCode) {
		return majorService.selectByParentCode(parentCode);
	}
	
	@RequestMapping("/update")
	public String updateStudent(int id ,ModelMap model){
		Student student = studentServiece.selectByPrimaryKey(id);
		if(student != null){
			//addMessage(model, new I18nMessage(messageAccessor, MessageCode.I000009));
		} else {
			addMessage(model, new I18nMessage(messageAccessor, MessageCode.I000006));
		}
		
		return "";
	}
}
