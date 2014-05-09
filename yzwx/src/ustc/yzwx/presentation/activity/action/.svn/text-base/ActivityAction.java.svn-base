package ustc.yzwx.presentation.activity.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
import ustc.yzwx.business.partakeRecord.PartakeRecordService;
import ustc.yzwx.common.core.util.FWLogger;
import ustc.yzwx.common.core.util.MajorMst;
import ustc.yzwx.common.core.util.RegionMst;
import ustc.yzwx.presentation.activity.form.Activity;
import ustc.yzwx.presentation.activity.form.ActivityBoardingInfo;
import ustc.yzwx.presentation.common.action.BaseAction;
import ustc.yzwx.presentation.student.form.Major;
import ustc.yzwx.presentation.student.form.Region;
import ustc.yzwx.wechat.util.AdvancedUtil;

@Controller
public class ActivityAction extends BaseAction {

	@Autowired
	private ActivityService activityService;
	@Autowired
	private PartakeRecordService partakeRecordService;
	@Autowired
	private FWLogger logger;
	
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
	public String toActivityList(ModelMap model, String name,String type, String curpage) {
		if (ValidateUtil.isNotNull(curpage) && curpage.length() > 0) {
			curPage = StringUtil.parseInteger(curpage);
		}
		PageResult activityPage = activityService.findAll(name, type,curPage,
				pageSize);
		model.addAttribute("activityPage", activityPage);
		model.addAttribute("name", name);
		model.addAttribute("type", type);
		return "activityList";
	}

	@RequestMapping("/toAddActivity")
	public String toAddActivity(ModelMap model) {
		// 地域
		List<Region> provinceList = RegionMst.getProvince();
		// 院系
		List<Major> parentMajorList = MajorMst.getParentMajor();
		model.addAttribute("provinceList", provinceList);
		model.addAttribute("parentMajorList", parentMajorList);
		return "addActivity";
	}

	@RequestMapping("/addAction")
	@Transactional
	public String save(@ModelAttribute("activity") Activity activity,
			ModelMap model) {
		try {
			activityService.save(activity);
			if (activity.getBoardingList().size() > 0) {
				for (ActivityBoardingInfo ab : activity.getBoardingList()) {
					if (ab.getBoardingInfo() != null
							&& !ab.getBoardingInfo().trim().equals("")) {
						ab.setActivityId(activity.getId());
						activityService.insertBoardingInfo(ab);
					}
				}
			}
		} catch (Exception e) {
			logger.error(e);
		}

		return "redirect:/toActivityList";
	}

	@RequestMapping("/update")
	@Transactional
	public String update(@ModelAttribute("activity") Activity activity,
			ModelMap model) {
		activityService.updateActivity(activity);
		if(activity.getBoardingList().size()>0){
			for(ActivityBoardingInfo ab:activity.getBoardingList()){
				if(ab.getBoardingInfo()!=null&&!ab.getBoardingInfo().trim().equals("")){
					if(ab.getId()!=null){
						//修改记录
						activityService.updBoardingById(ab);
					}else{
						ab.setActivityId(activity.getId());
						activityService.insertBoardingInfo(ab);
					}
				}
			}
		}
		
		
		return "redirect:/toActivityList";
	}
	
	@RequestMapping("/delBoarding")
	@ResponseBody
	public String delBoardingyId(int id){
		try {
			activityService.delBoardingById(id);
			return "success";
		} catch (Exception e) {
			logger.error(e);
			return "error";
		}
	}

	@RequestMapping("/getCity")
	@ResponseBody
	public List<Region> getCity(HttpServletRequest request,
			HttpServletResponse response, String parentId) throws IOException {
		List<Region> cityList = RegionMst.getCity(StringUtil
				.parseInteger(parentId));
		return cityList;
	}

	@RequestMapping("/toUpdateActivity")
	private String toUpdateActivity(ModelMap model, String id) {
		Activity activity = activityService.findById(StringUtil
				.parseInteger(id));
		activity.setBoardingList( activityService.getBoardingsByActivityId(StringUtil
				.parseInteger(id)));
		int provinceId = RegionMst.getParentId(StringUtil
				.parseInteger(activity.getRegionCode()));
		List<Region> provinceList = RegionMst.getProvince();
		model.addAttribute("activity", activity);
		model.addAttribute("provinceId", provinceId);
		model.addAttribute("provinceList", provinceList);
		return "updateActivity";
	}

	@RequestMapping("/deleteActivity")
	private ModelAndView deleteActivity(String id, HttpServletRequest request) {
		activityService.deleteActivity(StringUtil.parseInteger(id));
		// 文件删除
		String filePath = request.getSession().getServletContext()
				.getRealPath("/")
				+ "static/ticket";
		File file = new File(filePath + "/" + "1" + id + ".jpg");
		if (file.exists()) {
			file.delete();
		}
		file = new File(filePath + "/" + "2" + id + ".jpg");
		if (file.exists()) {
			file.delete();
		}
		return new ModelAndView("redirect:/toActivityList");
	}
	
	@RequestMapping("/checkActivityName")
	public void checkActivityName(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String message = "newRecord";
		String activityName = request.getParameter("activityName").trim();
		int count  = activityService.ajaxCheckActivityName(activityName);
		if(count >0){
			message = "existed";
		}
		response.getWriter().write(message);
	}
	
	@RequestMapping("/getQRCode")
	public String getQRCode(int activityId,HttpServletRequest request,ModelMap model){
		
		Activity ac = activityService.findById(activityId);
		model.addAttribute("ac",ac);
		String filePath=request.getSession().getServletContext().getRealPath("/")+"static/ticket";
		
		if(!new File(filePath+"/"+"1"+activityId+".jpg").exists()){
			String bmTicekt=activityService.selectQRCodeBySceneId(Integer.parseInt("1"+activityId));
			if(bmTicekt!=null){
				AdvancedUtil.getQRCode(bmTicekt, filePath,"1"+activityId);
			}
		}
		if(!new File(filePath+"/"+"2"+activityId+".jpg").exists()){
			String qdTicekt=activityService.selectQRCodeBySceneId(Integer.parseInt("2"+activityId));
			if(qdTicekt!=null){
				AdvancedUtil.getQRCode(qdTicekt, filePath,"2"+activityId);
			}
		}
		return "/getQRCode";
	}
	
	@RequestMapping("/getStudentListByActId")
	public String getStudentListByActId(int id,ModelMap model,String curpage){
		Activity act = activityService.findById(id);
		model.addAttribute("act", act);
		if (ValidateUtil.isNotNull(curpage) && curpage.length() > 0) {
			curPage = StringUtil.parseInteger(curpage);
		}
		PageResult page = partakeRecordService.getStudentListByActId(id,curPage,pageSize);
		model.addAttribute("page", page);
		
		return "/studentListForActivity";
	}

	@RequestMapping("/updateAudit")
	@ResponseBody
	public String updateAudit(int activityId,int studentId,String auditStatus){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("activityId", activityId);
		map.put("studentId", studentId);
		map.put("auditStatus", auditStatus.equals("t")?1:2);
		try {
			partakeRecordService.updateSelective(map);
			return "success";
		} catch (Exception e) {
			logger.error(e);
			return "error";
		}
		
		
	}
}
