package ustc.yzwx.integration.partakeRecord.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import ustc.yzwx.common.integration.dao.annotation.DaoMaster;
import ustc.yzwx.presentation.partakeRecord.form.PartakeRecord;

@DaoMaster
public interface PartakeRecordDao {

	public List<Map<String,Object>> chartForStudentMajor(Map<String,Object> map);
	
	public List<Map<String,Object>> chartForStudentSchool(Map<String,Object> map);
	
	public List<Map<String,Object>> chartForSchoolArea(Map<String,Object> map);
	
	public List<Map<String,Object>> queryActivityList(Map<String,Date> map);
	
	public List<Map<String,Object>> chartForStudentGPA(Map<String,Object> map);
	
	public List<Map<String,Object>> chartForStudentRank(Map<String,Object> map);
	
	public List<Map<String,Object>> chartForSatisfaction(Map<String,Date> map);
	
	public List<Map<String,Object>> querySuggestionListByActivityName(String activityName);
	
	/**
	 * 根据活动id，和status(0,查询全部；1,报名；2，签到，3，完成)查询该活动考生，报名，签到情况
	 * 根据考生ID查询参加过的活动
	 * @param studentId
	 * @return List PartakeRecord
	 */
	List<PartakeRecord> selectByStudentId(int studentId);
	
	/**
	 * 根据活动id，和status(0,查询全部；1,报名；2，签到)查询该活动考生，报名，签到情况
	 * @return
	 */
	public int getStuCountByActivityAndStatus(@Param("activityId") int activityId,@Param("status") int status);
}
