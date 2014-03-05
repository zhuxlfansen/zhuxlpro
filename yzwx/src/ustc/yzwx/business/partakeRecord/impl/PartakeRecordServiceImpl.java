package ustc.yzwx.business.partakeRecord.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ustc.yzwx.business.partakeRecord.PartakeRecordService;
import ustc.yzwx.integration.partakeRecord.dao.PartakeRecordDao;
import ustc.yzwx.presentation.partakeRecord.form.PartakeRecord;

@Service
public class PartakeRecordServiceImpl implements PartakeRecordService {

	@Autowired
	private PartakeRecordDao partakeRecordDao;

	@Override
	public List<Map<String, Object>> chartForStudentMajor(Integer activityId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("activityId", activityId);
		map.put("nowTime", new Date());
		return partakeRecordDao.chartForStudentMajor(map);
	}

	@Override
	public List<Map<String, Object>> chartForStudentSchool(Integer activityId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("activityId", activityId);
		map.put("nowTime", new Date());
		return partakeRecordDao.chartForStudentSchool(map);
	}

	@Override
	public List<Map<String, Object>> chartForSchoolArea(Integer activityId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("activityId", activityId);
		map.put("nowTime", new Date());
		return partakeRecordDao.chartForSchoolArea(map);
	}

	@Override
	public List<Map<String, Object>> queryActivityList(Date startTime,
			Date endTime) {
		Map<String,Date> map = new HashMap<String,Date>();
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		map.put("nowTime", new Date());
		return partakeRecordDao.queryActivityList(map);
	}

	@Override
	public List<Map<String, Object>> chartForStudentGPA(Integer activityId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("activityId", activityId);
		map.put("nowTime", new Date());
		return partakeRecordDao.chartForStudentGPA(map);
	}

	@Override
	public List<Map<String, Object>> chartForStudentRank(Integer activityId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("activityId", activityId);
		map.put("nowTime", new Date());
		return partakeRecordDao.chartForStudentRank(map);
	}

	@Override
	public List<Map<String, Object>> chartForSatisfaction(Date startTime,
			Date endTime) {
		Map<String,Date> map = new HashMap<String,Date>();
		map.put("startTime", startTime);
		map.put("endTime", endTime);
		map.put("nowTime", new Date());
		return partakeRecordDao.chartForSatisfaction(map);
	}

	@Override
	public List<Map<String, Object>> querySuggestionListByActivityName(
			String activityName) {
		return partakeRecordDao.querySuggestionListByActivityName(activityName);
	}

	@Override
	public List<PartakeRecord> selectByStudentId(int studentId) {
		return partakeRecordDao.selectByStudentId(studentId);
	}
	
}
