package ustc.yzwx.business.partakeRecord.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ustc.yzwx.business.partakeRecord.PRChartService;
import ustc.yzwx.integration.activity.dao.ActivityDao;
import ustc.yzwx.integration.partakeRecord.dao.PRChartDao;
import ustc.yzwx.presentation.activity.form.ActivityBoardingInfo;


@Service
public class PRChartServiceImpl implements PRChartService {

	@Autowired
	private PRChartDao prchartDao;
	@Autowired
	private ActivityDao activityDao;
	
	public List<Integer> getYearListForReport(){
		return prchartDao.getYearListForReport();
	}
	
	public List<Map<String,Object>> getReportListByYear(int year){
		return prchartDao.getReportListByYear(year);
	}
	
	@Override
	public Map<String,Object> getReportInfoById(int activityId){
		Map<String,Object> map=prchartDao.getReportInfoById(activityId);
		List<ActivityBoardingInfo> list =activityDao.getBoardingsByActivityId(activityId);
		for(ActivityBoardingInfo ab:list){
			ab.setTotalStu(activityDao.countTotalStu(ab));
		}
		map.put("boarding", list);
		return map;
	}
	
	@Override
	public List<Map<String, Object>> chartForStudentMajor(Integer activityId,String type,Integer year) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("activityId", activityId);
		map.put("type", type);
		map.put("year", year);
		List<Map<String,Object>> mapList =prchartDao.chartForStudentMajor(map);
		int c = prchartDao.countForStudentMajor(map);
		for(Map<String,Object> m:mapList){
			m.put("stuCount", c);
		}
		return mapList;
	}

	@Override
	public List<Map<String, Object>> chartForStudentSchool(Integer activityId,String type,Integer year) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("activityId", activityId);
		map.put("type", type);
		map.put("year", year);
		return prchartDao.chartForStudentSchool(map);
	}

	@Override
	public List<Map<String, Object>> chartForSchoolArea(Integer activityId,String type,Integer year) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("activityId", activityId);
		map.put("type", type);
		map.put("year", year);
		return prchartDao.chartForSchoolArea(map);
	}


	@Override
	public List<Map<String, Object>> chartForStudentGPA(Integer activityId,String type,Integer year) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("activityId", activityId);
		map.put("type", type);
		map.put("year", year);
		return prchartDao.chartForStudentGPA(map);
	}

	@Override
	public List<Map<String, Object>> chartForStudentRank(Integer activityId,String type,Integer year) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("activityId", activityId);
		map.put("type", type);
		map.put("year", year);
		return prchartDao.chartForStudentRank(map);
	}

	@Override
	public Map<String, Object> chartForSatisfaction(Integer year) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("nowTime", new Date());
		map.put("year", year);
		
		Map<String,Object> mainMap = new HashMap<String,Object>();
		mainMap.put("satisZZList", prchartDao.chartForSatisZZ(map));
		mainMap.put("satisNRList", prchartDao.chartForSatisNR(map));
		mainMap.put("satisJDList", prchartDao.chartForSatisJD(map));
		mainMap.put("sum", prchartDao.countForSatis(map));
		return mainMap;
	}

	@Override
	public Map<String, Object> querySuggestionListByActivityId(Integer activityId) {
		Map<String,Object> mainMap = new HashMap<String,Object>();
		mainMap.put("satisList", prchartDao.querySuggestionListByActivityId(activityId));
		mainMap.put("satisMap", prchartDao.countSatisForReport(activityId));
		return mainMap;
	}
}
