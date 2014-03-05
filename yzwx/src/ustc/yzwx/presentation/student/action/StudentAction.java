package ustc.yzwx.presentation.student.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import unis.base.util.PageResult;
import unis.base.util.StringUtil;
import unis.base.util.ValidateUtil;
import ustc.yzwx.business.activity.ActivityService;
import ustc.yzwx.business.student.MajorService;
import ustc.yzwx.business.student.RegionService;
import ustc.yzwx.business.student.StudentService;
import ustc.yzwx.presentation.activity.form.Activity;
import ustc.yzwx.presentation.student.form.Major;
import ustc.yzwx.presentation.student.form.Region;

@Controller
public class StudentAction {
	
	@Autowired
	private StudentService studentService;
	@Autowired
	private ActivityService activityService;
	@Autowired
	private RegionService regionService ;
	@Autowired
	private MajorService majorService;
	
	private int pageSize = 8;
	private int curPage=1;
	
	/**
	 * 根据活动id 查询该活动下的所有考生
	 * @param model
	 * @param activityId
	 * @param curpage
	 * @return
	 */
	@RequestMapping("/findStuByActivity")
	public String findStuByActivity(ModelMap model,String activityId,String provinceId,String majorCode,String curpage){
		if(ValidateUtil.isNotNull(curpage)){
			curPage = StringUtil.parseInteger(curpage);
		}
		List<Activity> activityList = activityService.findAll();
		List<Region> provinceList = regionService.getProvince();
		List<Major> majorList = majorService.getAllMajor();
	//	PageResult stuList = studentService.findByActivity(activityId,curPage,pageSize);
		PageResult stuList = studentService.findByParams(activityId, majorCode, provinceId, curPage, pageSize);
		model.addAttribute("stList", stuList);
		model.addAttribute("activityList", activityList);
		model.addAttribute("provinceList", provinceList);
		model.addAttribute("majorList", majorList);
		model.addAttribute("activityId", activityId);
		model.addAttribute("provinceId", provinceId);
		model.addAttribute("majorCode", majorCode);
		return "studentList";
	}

}
