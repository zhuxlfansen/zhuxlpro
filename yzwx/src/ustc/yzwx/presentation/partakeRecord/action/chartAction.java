package ustc.yzwx.presentation.partakeRecord.action;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ustc.yzwx.business.partakeRecord.PartakeRecordService;

@Controller
@RequestMapping("/chart")
public class chartAction {

	@Autowired
	private PartakeRecordService partakeRecordService;
	
	@RequestMapping("/activityPartake")
	public String activityPartake(Model model){
		List<Map<String,Object>> activityList=partakeRecordService.queryActivityList(null, null);
		model.addAttribute("activityList", activityList);
		return "chart/chartForActivityPartake";
	}
	
	@RequestMapping("/queryActivityList")
	@ResponseBody
	public List<Map<String,Object>> queryActivityList(String startTime,String endTime){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date start=null;
		Date end=null;
		try {
			if(startTime!=null&&!startTime.trim().equals("")){
				start= sdf.parse(startTime+" 00:00:00");
			}
			if(endTime!=null&&!endTime.trim().equals("")){
				end = sdf.parse(endTime+" 24:00:00");
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return partakeRecordService.queryActivityList(start, end);
	}
	
	@RequestMapping("/studentMajor")
	@ResponseBody
	public List<Map<String,Object>> chartForStudentMajor(Integer activityId){
		return partakeRecordService.chartForStudentMajor(activityId);
	}
	
	@RequestMapping("/studentSchool")
	@ResponseBody
	public List<Map<String,Object>> chartForStudentSchool(Integer activityId){
		return partakeRecordService.chartForStudentSchool(activityId);
	}
	
	@RequestMapping("/schoolArea")
	@ResponseBody
	public List<Map<String,Object>> chartForSchoolArea(Integer activityId){
		return partakeRecordService.chartForSchoolArea(activityId);
	}
	
	@RequestMapping("/studentGPA")
	@ResponseBody
	public List<Map<String,Object>> chartForStudentGPA(Integer activityId){
		return partakeRecordService.chartForStudentGPA(activityId);
	}
	
	@RequestMapping("/studentRank")
	@ResponseBody
	public List<Map<String,Object>> chartForStudentRank(Integer activityId){
		return partakeRecordService.chartForStudentRank(activityId);
	}
	

	@RequestMapping("/activitySatisfaction")
	public String activitySatisfaction(){
		return "chart/chartForSatisfaction";
	}
	
	@RequestMapping("/satisfaction")
	@ResponseBody
	public List<Map<String,Object>> chartForSatisfaction(String startTime,String endTime){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date start=null;
		Date end=null;
		try {
			if(startTime!=null&&!startTime.trim().equals("")){
				start= sdf.parse(startTime+" 00:00:00");
			}
			if(endTime!=null&&!endTime.trim().equals("")){
				end = sdf.parse(endTime+" 24:00:00");
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return partakeRecordService.chartForSatisfaction(start, end);
	}
	
	@RequestMapping("/suggestionList")
	@ResponseBody
	public List<Map<String,Object>> querySuggestionList(String activityName){
		return partakeRecordService.querySuggestionListByActivityName(activityName);
	}
}
