package ustc.yzwx.integration.partakeRecord.dao;

import java.util.List;
import java.util.Map;

import ustc.yzwx.common.integration.dao.annotation.DaoMaster;

@DaoMaster
public interface PRChartDao {

	public List<Integer> getYearListForReport();
	
	public List<Map<String,Object>> getReportListByYear(int year);
	
	public Map<String,Object> getReportInfoById(int activityId);
	
	public List<Map<String, Object>> chartForStudentMajor(Map<String, Object> map);
	public int countForStudentMajor(Map<String,Object> map);
	
	public List<Map<String, Object>> chartForStudentSchool(Map<String, Object> map);

	public List<Map<String, Object>> chartForSchoolArea(Map<String, Object> map);

	public List<Map<String, Object>> chartForStudentGPA(Map<String, Object> map);

	public List<Map<String, Object>> chartForStudentRank(Map<String, Object> map);

	/**
	 * 满意度线表查询
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> chartForSatisZZ(Map<String, Object> map);
	public List<Map<String, Object>> chartForSatisNR(Map<String, Object> map);
	public List<Map<String, Object>> chartForSatisJD(Map<String, Object> map);
	public Integer countForSatis(Map<String, Object> map);

	public List<Map<String, Object>> querySuggestionListByActivityId(Integer activityId);
	public Map<String,Object> countSatisForReport(Integer activityId);
	
}
