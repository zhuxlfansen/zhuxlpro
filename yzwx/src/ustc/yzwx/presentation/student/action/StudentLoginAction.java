package ustc.yzwx.presentation.student.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import ustc.yzwx.business.partakeRecord.PartakeRecordService;
import ustc.yzwx.business.student.SchoolService;
import ustc.yzwx.business.student.StudentMajorService;
import ustc.yzwx.business.student.StudentService;
import ustc.yzwx.business.student.SubscribeService;
import ustc.yzwx.common.constants.Constants;
import ustc.yzwx.common.constants.MessageCode;
import ustc.yzwx.common.core.i18n.I18nMessage;
import ustc.yzwx.common.core.util.FWLogger;
import ustc.yzwx.common.core.util.MajorMst;
import ustc.yzwx.common.core.util.RegionMst;
import ustc.yzwx.common.core.util.SchoolMst;
import ustc.yzwx.presentation.activity.form.Activity;
import ustc.yzwx.presentation.common.action.BaseAction;
import ustc.yzwx.presentation.partakeRecord.form.PartakeRecord;
import ustc.yzwx.presentation.student.form.Major;
import ustc.yzwx.presentation.student.form.Region;
import ustc.yzwx.presentation.student.form.School;
import ustc.yzwx.presentation.student.form.Student;
import ustc.yzwx.wechat.util.EncryptUtils;

/**
 * 考生完善信息Action
 * 
 * @author zcy
 * @version 1.0.0 2014-2-21
 */

@Controller
@RequestMapping("/mob")
public class StudentLoginAction extends BaseAction {

	/**
	 * Spring 注入StudentService对象
	 */
	@Autowired
	private StudentService studentService;

	/**
	 * Spring 注入SchoolService对象
	 */
	@Autowired
	private SchoolService schoolService;

	/**
	 * Spring 注入PartakeRecordService对象
	 */
	@Autowired
	private PartakeRecordService partakeRecordService;

	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	private StudentMajorService studentMajorService;

	/**
	 * 考生详情初始界面
	 * 
	 * @param model
	 * @return string:studentDetail
	 */
	@RequestMapping("/student/login")
	public String init(String wxCode, String eventKey, ModelMap model) {
		
		// 用户还没有关注，无法注册。（可能为用户修改url里的 wxCode 参数）
		if (subscribeService.countByWxCode(wxCode) == 0) {
			addMessage(model, new I18nMessage(messageAccessor,
					MessageCode.E000080));
			return "studentLoginSuccess";
		}

		Student student = studentService.selectByWxCode(wxCode);

		if (student == null) {
			student = new Student();
			student.setWxCode(wxCode);
		} else {
			School school = student.getSchool();
			model.addAttribute("school", school);
			
			Region province = new Region();
			province = RegionMst.selectRegionByCode(school.getProvince());
			
			model.addAttribute("province", province);
			
			Region city = new Region();
			city = RegionMst.selectRegionByCode(school.getCity());
			
			model.addAttribute("city", city);
			
			Major major = student.getMajor();
			model.addAttribute("major", major);
			
			// 考生专业
			List<Map<String,Object>> majorcodes = studentMajorService.selectByStudentId(student.getId());
			
			if(majorcodes!=null && majorcodes.size()>0){
				model.addAttribute("majorcodes", majorcodes);
			}
		}

		model.addAttribute("student", student);

		// 查出一级专业
		List<Major> parentMajorList = MajorMst.getParentMajor();
		model.addAttribute("parentMajorList", parentMajorList);

		// 如果是考生报名1 签到2 扫二维码
		if (eventKey != null && !"".equals(eventKey)) {
			model.addAttribute("eventKey", eventKey);
			String eventKeyDec = EncryptUtils.decrypt(eventKey);
			if (eventKeyDec.length() > 8) {

				if (!Constants.ActivityStatusSet.QRSCENE.equals(eventKeyDec
						.substring(0, 8))) {

					addMessage(model, new I18nMessage(messageAccessor,
							MessageCode.UNKNOW));
					return "studentLoginSuccess";
				}
			} else {
				addMessage(model, new I18nMessage(messageAccessor,
						MessageCode.UNKNOW));
				return "studentLoginSuccess";
			}
		}

		return "studentLogin";
	}

	/**
	 * 提交考生注册信息
	 * 
	 * @param student
	 * @param imgFile
	 * @return
	 */
	@RequestMapping("/student/submitLogin")
	public String submitLogin(Student student,
			@RequestParam(value = "imgFile") MultipartFile imgFile,
			@RequestParam(value = "majorcodes") String[] majorcodes,
			String eventKey, ModelMap model) {
		try {
			if (!imgFile.isEmpty()) {
				byte[] bytes = imgFile.getBytes();
				student.setGpaImg(bytes);
			}
			student.setStatus((short) 1);
			
			// 把第一个拟报考专业存到student里
			student.setMajorCode(majorcodes[0]);
			
			// 判断之前是否注册过
			Student oldStu = studentService.selectByWxCode(student.getWxCode());
			
			if (oldStu != null) {
				student.setId(oldStu.getId());
				studentService.updateByPrimaryKeySelective(student);
				studentMajorService.updateByStudentId(majorcodes ,oldStu.getId());
			} else {
				studentService.addStudentSelective(student);
				studentMajorService.addList(majorcodes ,studentService.selectByWxCode(student.getWxCode()).getId());
			}
			
			addMessage(model, new I18nMessage(messageAccessor,
					MessageCode.I000013));

			// 考生扫面的参数带二维码，即为报名，签到操作
			if (eventKey != null && !"".equals(eventKey)) {
				eventKey = EncryptUtils.decrypt(eventKey);
				eventKey = eventKey.substring(8);

				// 往考生报名表加一条
				PartakeRecord pr = new PartakeRecord();
				Student stu = studentService
						.selectByWxCode(student.getWxCode());
				pr.setStudent(stu);
				Activity act = new Activity();
				act.setId(Integer.parseInt(eventKey.substring(1)));
				pr.setActivity(act);
				pr.setStatus(Integer.parseInt(eventKey.substring(0, 1)));

				if (partakeRecordService.selectByStudentAndActivity(pr) != null) {
					partakeRecordService.updateByStudentAndActivity(pr);
				} else {
					partakeRecordService.addSelective(pr);
				}

				if (Integer.parseInt(eventKey.substring(0, 1)) == Constants.ActivityStatusSet.STATUS_APPLY) {
					addMessage(model, new I18nMessage(messageAccessor,
							MessageCode.I000011));
				} else {
					addMessage(model, new I18nMessage(messageAccessor,
							MessageCode.I000012));
				}

			}
		} catch (Exception e) {
			
			FWLogger logger = new FWLogger();
			logger.error(e);
			e.printStackTrace();
			addMessage(model, new I18nMessage(messageAccessor,
					MessageCode.UNKNOW));
			return "studentLoginSuccess";
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
	@RequestMapping("/student/loadSchools")
	@ResponseBody
	public List<School> loadSchools(String place) {
		Region region = RegionMst.selectRegionById(Integer.parseInt(place));

		if (region != null) {
			return SchoolMst.selectByPlace(region.getCode());
		}

		return null;
	}

	/**
	 * 根据院系Code获得下面的专业列表
	 * 
	 * @param parentCode
	 * @return List Major
	 */
	@RequestMapping("/student/loadMajors")
	@ResponseBody
	public List<Major> loadMajors(String parentCode) {
		return MajorMst.selectByParentCode(parentCode);
	}

	/**
	 * 根据考生ID查出考生详情并放到修改考生信息页面
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/student/update")
	public String updateStudent(int id, ModelMap model) {
		Student student = studentService.selectByPrimaryKey(id);
		if (student != null) {
			model.addAttribute("student", student);
		}

		return "studentUpdate";
	}
	
	@RequestMapping("/student/checkIdCardNum")
	@ResponseBody
	public String checkIdCardNum(String idCardNum) {
		return studentService.checkExistByIdCardNum(idCardNum)>0?"error":"success";
	}
}
