package ustc.yzwx.integration.partakeRecord.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import ustc.yzwx.common.integration.dao.annotation.DaoMaster;
import ustc.yzwx.presentation.partakeRecord.form.PartakeRecord;

@DaoMaster
public interface PartakeRecordDao {

	public List<Map<String, Object>> chartForStudentMajor(
			Map<String, Object> map);

	public List<Map<String, Object>> chartForStudentSchool(
			Map<String, Object> map);

	public List<Map<String, Object>> chartForSchoolArea(Map<String, Object> map);

	public List<Map<String, Object>> queryActivityList(Map<String, Date> map);

	public List<Map<String, Object>> chartForStudentGPA(Map<String, Object> map);

	public List<Map<String, Object>> chartForStudentRank(Map<String, Object> map);

	public List<Map<String, Object>> chartForSatisfaction(Map<String, Date> map);

	public List<Map<String, Object>> querySuggestionListByActivityName(
			String activityName);

	public Map<String, Object> queryPartakeRecordByKey(Map<String, Object> map);

	/**
	 * 根据微信号查找该用户参与过的活动
	 * 
	 * @param wxCode
	 *            微信号
	 * @return
	 */
	public List<Map<String, Object>> queryPartakeRecordsByWxCode(String wxCode);

	/**
	 * 根据活动id，和status(0,查询全部；1,报名；2，签到，3，完成)查询该活动考生，报名，签到情况 根据考生ID查询参加过的活动
	 * 
	 * @param studentId
	 * @return List PartakeRecord
	 */
	List<PartakeRecord> selectByStudentId(int studentId);

	/**
	 * 根据活动id，和status(0,查询全部；1,报名；2，签到)查询该活动考生，报名，签到情况
	 * 
	 * @return
	 */
	public int getStuCountByActivityAndStatus(
			@Param("activityId") int activityId, @Param("status") int status);

	/**
	 * 保存考生报名
	 * 
	 * @param partakeRecord
	 * @return
	 */
	int insertSelective(PartakeRecord partakeRecord);

	/**
	 * 根据考生ID和活动ID查询
	 * 
	 * @param partakeRecord
	 * @return
	 */
	PartakeRecord selectByStudentAndActivity(PartakeRecord partakeRecord);

	/**
	 * 根据考生ID和活动ID更新
	 * 
	 * @param partakeRecord
	 */
	void updateByStudentAndActivity(PartakeRecord partakeRecord);

	/**
	 * 根据考生id和活动id查询报名记录
	 * 
	 * @param stuId
	 *            考生id
	 * @param actId
	 *            活动id
	 * @return 一条记录
	 */
	public int findByStuIdAndActId(@Param("stuId") int stuId,
			@Param("actId") int actId);

	/**
	 * 修改参与记录
	 * 
	 * @param map
	 */
	public int updateSelective(Map<String, Object> map);

	/**
	 * 根据微信CODE查找学生对象
	 * 
	 * @param wxCode
	 * @return
	 */
	public int selectStudentByWxCode(String wxCode);

	public List<Map<String,Object>> getStudentListByActId(@Param("activityId") int activityId,@Param("offset") int offset, @Param("limit") int limit);
	
	public int totalCount(@Param("activityId") int activityId);
}
