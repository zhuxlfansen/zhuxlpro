package ustc.yzwx.business.partakeRecord;

import java.util.Date;
import java.util.List;
import java.util.Map;

import ustc.yzwx.presentation.partakeRecord.form.PartakeRecord;

public interface PartakeRecordService {

	public List<Map<String,Object>> chartForStudentMajor(Integer activityId);
	
	public List<Map<String,Object>> chartForStudentSchool(Integer activityId);
	
	public List<Map<String,Object>> chartForSchoolArea(Integer activityId);
	
	public List<Map<String,Object>> queryActivityList(Date startTime,Date endTime);
	
	public List<Map<String,Object>> chartForStudentGPA(Integer activityId);
	
	public List<Map<String,Object>> chartForStudentRank(Integer activityId);
	
	public List<Map<String,Object>> chartForSatisfaction(Date startTime,Date endTime);
	
	public List<Map<String,Object>> querySuggestionListByActivityName(String activityName);
	
	/**
	 * 根据考生ID查询参加过的活动
	 * @param studentId
	 * @return List PartakeRecord
	 */
	List<PartakeRecord> selectByStudentId(int studentId);
}
