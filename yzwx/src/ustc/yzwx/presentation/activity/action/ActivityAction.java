package ustc.yzwx.presentation.activity.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import unis.base.util.PageResult;
import unis.base.util.StringUtil;
import unis.base.util.ValidateUtil;
import ustc.yzwx.business.activity.ActivityService;
import ustc.yzwx.business.student.RegionService;
import ustc.yzwx.presentation.activity.form.Activity;
import ustc.yzwx.presentation.student.form.Region;

@Controller
public class ActivityAction {

	@Autowired
	private ActivityService activityService;
	@Autowired
	private RegionService regionService;

	private int pageSize = 8;
	private int curPage = 1;

	/**
	 * 封装form时绑定date类型
	 * 
	 * @param binder
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));
	}

	@RequestMapping("/toActivityList")
	public String toActivityList(ModelMap model, String name, String curpage) {
		if (ValidateUtil.isNotNull(curpage) && curpage.length() > 0) {
			curPage = StringUtil.parseInteger(curpage);
		}
		PageResult activityPage = activityService.findAll(name, curPage,
				pageSize);
		model.addAttribute("activityPage", activityPage);
		model.addAttribute("name", name);
		return "activityList";
	}

	@RequestMapping("/toAddActivity")
	public String toAddActivity(ModelMap model) {
		List<Region> provinceList = regionService.getProvince();
		model.addAttribute("provinceList", provinceList);
		return "addActivity";
	}

	@RequestMapping("/addAction")
	public ModelAndView save(@ModelAttribute("activity") Activity activity) {
		activityService.save(activity);
		return new ModelAndView("redirect:/toActivityList");
	}

	@RequestMapping("/update")
	public ModelAndView update(@ModelAttribute("activity") Activity activity) {
		activityService.updateActivity(activity);
		return new ModelAndView("redirect:/toActivityList");
	}

	@RequestMapping("/getCity")
	@ResponseBody
	public List<Region> getCity(HttpServletRequest request,
			HttpServletResponse response, String parentId) throws IOException {
		List<Region> cityList = regionService.getCity(StringUtil
				.parseInteger(parentId));
		return cityList;
	}

	@RequestMapping("/toUpdateActivity")
	private String toUpdateActivity(ModelMap model, String id) {
		Activity activity = activityService.findById(StringUtil
				.parseInteger(id));
		int provinceId = regionService.getParentId(StringUtil
				.parseInteger(activity.getRegionCode()));
		List<Region> provinceList = regionService.getProvince();
		model.addAttribute("activity", activity);
		model.addAttribute("provinceId", provinceId);
		model.addAttribute("provinceList", provinceList);
		return "updateActivity";
	}
	
	@RequestMapping("/deleteActivity")
	private ModelAndView deleteActivity(String id) {
		activityService.deleteActivity(StringUtil.parseInteger(id));
		return new ModelAndView("redirect:/toActivityList");
	}

}
