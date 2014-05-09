package ustc.yzwx.business.partakeRecord.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import unis.base.util.PageResult;
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

	@Override
	public List<Map<String, Object>> queryPartakeRecordsByWxCode(String wxCode) {
		return partakeRecordDao.queryPartakeRecordsByWxCode(wxCode);
	}

	@Override
	public Map<String, Object> queryPartakeRecordByKey(String wxCode,int activityId) {
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("wxCode", wxCode);
		map.put("activityId", activityId);
		return partakeRecordDao.queryPartakeRecordByKey(map);
	}

	@Override
	public void addSelective(PartakeRecord partakeRecord) {
		partakeRecordDao.insertSelective(partakeRecord);
	}

	@Override
	public int updateSelective(Map<String, Object> map) {
		return partakeRecordDao.updateSelective(map);
	}

	@Override
	public int selectStudentByWxCode(String wxCode) {
		return partakeRecordDao.selectStudentByWxCode(wxCode);
	}

	@Override
	public PartakeRecord selectByStudentAndActivity(PartakeRecord partakeRecord) {
		return partakeRecordDao.selectByStudentAndActivity(partakeRecord);
	}

	@Override
	public void updateByStudentAndActivity(PartakeRecord partakeRecord) {
		partakeRecordDao.updateByStudentAndActivity(partakeRecord);
	}

	@Override
	public int findByStuIdAndActId(int stuId, int actId) {
		return partakeRecordDao.findByStuIdAndActId(stuId, actId);
	}

	@Override
	public int insertSelective(PartakeRecord partakeRecord) {
		return partakeRecordDao.insertSelective(partakeRecord);
	}

	@Override
	public PageResult getStudentListByActId(int activityId,
			int curPage, int pageSize) {
		int offset = _topage(curPage, pageSize);
		int count = partakeRecordDao.totalCount(activityId);
		
		List<Map<String,Object>> sList = partakeRecordDao.getStudentListByActId(activityId, offset, pageSize);
		return new PageResult(sList, count, pageSize, curPage);
	}
	
	private int _topage(int curPage, int pageSize) {
		int offset = 0;
		if (curPage > 0) {
			offset = (curPage - 1) * pageSize;
		} else {
			offset = 0;
		}
		return offset;
	}
	
}
