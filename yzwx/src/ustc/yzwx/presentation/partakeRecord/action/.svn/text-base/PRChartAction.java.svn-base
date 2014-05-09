package ustc.yzwx.presentation.partakeRecord.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ustc.yzwx.business.partakeRecord.PRChartService;
import ustc.yzwx.common.core.util.MajorMst;
import ustc.yzwx.presentation.student.form.Major;

@Controller
@RequestMapping("/prchart")
public class PRChartAction {

	@Autowired
	private PRChartService prchartService;
	
	private int size=19;//定义统计表需要展示多少条数据
	
	@RequestMapping("/reportPartakeChart")
	public String reportPRList(Model model){
		List<Integer> list = prchartService.getYearListForReport();
		model.addAttribute("yearList",list);
		if(list.size()>0){
			model.addAttribute("reportList",prchartService.getReportListByYear(list.get(0)));
		}
		return "chart/reportPRList";
	}
	
	// 演示用----------------------start
	//TODO
	@RequestMapping("/campPartakeChart")
	public String campPRList(Model model){
		List<Integer> list = prchartService.getYearListForReport();
		model.addAttribute("yearList",list);
		
		List<Map<String,Object>> campList = new ArrayList<Map<String,Object>> ();
		Map<String,Object> tmpMap = new HashMap<String,Object>();
		tmpMap.put("id", 102);
		tmpMap.put("name", "人文与社会科学学院");
		campList.add(tmpMap);
		Map<String,Object> tmpMap1 = new HashMap<String,Object>();
		tmpMap1.put("id", 104);
		tmpMap1.put("name", "数学科学学院");
		campList.add(tmpMap1);
		Map<String,Object> tmpMap2 = new HashMap<String,Object>();
		tmpMap2.put("id", 120);
		tmpMap2.put("name", "管理学院");
		campList.add(tmpMap2);
		
		if(list.size()>0){
			model.addAttribute("reportList",campList);
		}
		return "chart/campPRList";
	}
	/**
	 * 获取报告会的年份列表
	 * @param year
	 * @return
	 */
	@RequestMapping("/getCampListByYear")
	@ResponseBody
	public List<Map<String,Object>> getCampListByYear(Integer year){
		if(year!=null){
			
			List<Map<String,Object>> campList = new ArrayList<Map<String,Object>> ();
			Map<String,Object> tmpMap = new HashMap<String,Object>();
			tmpMap.put("id", 102);
			tmpMap.put("name", "人文与社会科学学院");
			campList.add(tmpMap);
			Map<String,Object> tmpMap1 = new HashMap<String,Object>();
			tmpMap.put("id", 104);
			tmpMap.put("name", "数学科学学院");
			campList.add(tmpMap1);
			Map<String,Object> tmpMap2 = new HashMap<String,Object>();
			tmpMap.put("id", 120);
			tmpMap.put("name", "管理学院");
			campList.add(tmpMap2);
			
			return campList;
		}else return null;
	}
	// 演示用----------------------end
	
	
	/**
	 * 获取报告会的年份列表
	 * @param year
	 * @return
	 */
	@RequestMapping("/getReportListByYear")
	@ResponseBody
	public List<Map<String,Object>> getReportListByYear(Integer year){
		if(year!=null){
			return prchartService.getReportListByYear(year);
		}else return null;
	}
	
	@RequestMapping("/getReportInfo")
	@ResponseBody
	public Map<String,Object> getReportInfo(Integer activityId){
		return prchartService.getReportInfoById(activityId);
	}
	
	@RequestMapping("/studentMajor")
	@ResponseBody
	public List<Map<String,Object>> chartForStudentMajor(Integer activityId,String type,Integer year){
		List<Map<String,Object>> mapList =prchartService.chartForStudentMajor(activityId,type,year);
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
	public List<Map<String,Object>> chartForStudentSchool(Integer activityId,String type,Integer year){
		List<Map<String,Object>> mapList = prchartService.chartForStudentSchool(activityId,type,year);
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
	
	@RequestMapping("/schoolArea")
	@ResponseBody
	public List<Map<String,Object>> chartForSchoolArea(Integer activityId,String type,Integer year){
		List<Map<String,Object>> mapList =prchartService.chartForSchoolArea(activityId,type,year);
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
	public List<Map<String,Object>> chartForStudentGPA(Integer activityId,String type,Integer year){
		return prchartService.chartForStudentGPA(activityId,type,year);
	}
	
	@RequestMapping("/studentRank")
	@ResponseBody
	public List<Map<String,Object>> chartForStudentRank(Integer activityId,String type,Integer year){
		return prchartService.chartForStudentRank(activityId,type,year);
	}
	

	@RequestMapping("/satisfaction")
	@ResponseBody
	public Map<String,Object> chartForSatisfaction(int year){
		return prchartService.chartForSatisfaction(year);
	}
	
	@RequestMapping("/suggestionList")
	@ResponseBody
	public Map<String,Object> querySuggestionList(Integer activityId){
		return prchartService.querySuggestionListByActivityId(activityId);
	}
	
}
