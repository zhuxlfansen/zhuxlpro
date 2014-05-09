package ustc.yzwx.presentation.partakeRecord.action;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
	
	private int size=19;//定义统计表需要展示多少条数据
	
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
		
		List<Map<String,Object>> mapList =partakeRecordService.chartForStudentMajor(activityId);
		if(mapList.size()>size){
			List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			for(int i=0;i<size;i++){
				list.add(mapList.get(i));
			}
			long sumValue=0;
			for(int i=size;i<mapList.size();i++){
				sumValue+=(Long)mapList.get(i).get("value");
			}
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("value", sumValue);
			map.put("name", "其他");
			list.add(map);
			return list;
		}else return mapList;
	}
	
	@RequestMapping("/studentSchool")
	@ResponseBody
	public List<Map<String,Object>> chartForStudentSchool(Integer activityId){
		
		List<Map<String,Object>> mapList =partakeRecordService.chartForStudentSchool(activityId);
		if(mapList.size()>size){
			List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			for(int i=0;i<size;i++){
				list.add(mapList.get(i));
			}
			long sumValue=0;
			for(int i=size;i<mapList.size();i++){
				sumValue+=(Long)mapList.get(i).get("value");
			}
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("value", sumValue);
			map.put("name", "其他");
			map.put("stuCount", (Long)mapList.get(0).get("stuCount"));
			list.add(map);
			return list;
		}else return mapList;
		
	}
	
	@RequestMapping("/schoolArea")
	@ResponseBody
	public List<Map<String,Object>> chartForSchoolArea(Integer activityId){
		
		List<Map<String,Object>> mapList =partakeRecordService.chartForSchoolArea(activityId);
		if(mapList.size()>size){
			List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
			for(int i=0;i<size;i++){
				list.add(mapList.get(i));
			}
			long sumValue=0;
			for(int i=size;i<mapList.size();i++){
				sumValue+=(Long)mapList.get(i).get("value");
			}
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("value", sumValue);
			map.put("name", "其他");
			list.add(map);
			return list;
		}else return mapList;
		
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
