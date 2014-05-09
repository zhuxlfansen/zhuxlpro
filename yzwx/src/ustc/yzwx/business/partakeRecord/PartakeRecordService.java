package ustc.yzwx.business.partakeRecord;

import java.util.Date;
import java.util.List;
import java.util.Map;

import unis.base.util.PageResult;
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
	
	public List<Map<String,Object>> queryPartakeRecordsByWxCode(String wxCode);
	
	public Map<String,Object> queryPartakeRecordByKey(String wxCode,int activityId);
	
	public int updateSelective(Map<String,Object> map);
	
	public int selectStudentByWxCode(String wxCode);
	
	/**
	 * 根据考生ID查询参加过的活动
	 * @param studentId
	 * @return List PartakeRecord
	 */
	List<PartakeRecord> selectByStudentId(int studentId);
	
	/**
	 * 增加1条纪录
	 * @param partakeRecord
	 */
	void addSelective(PartakeRecord partakeRecord);
	
	/**
	 * 根据考生ID和活动ID查询
	 * @param partakeRecord
	 * @return
	 */
	PartakeRecord selectByStudentAndActivity(PartakeRecord partakeRecord);
	
	/**
	 * 根据考生ID和活动ID更新
	 * @param partakeRecord
	 */
	void updateByStudentAndActivity(PartakeRecord partakeRecord);
	
	int findByStuIdAndActId(int stuId, int actId);

	int insertSelective(PartakeRecord partakeRecord);
	
	PageResult getStudentListByActId(int activityId,int curPage,int pageSize);
}
