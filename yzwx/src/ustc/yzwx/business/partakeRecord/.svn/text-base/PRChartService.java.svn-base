package ustc.yzwx.business.partakeRecord;

import java.util.List;
import java.util.Map;

public interface PRChartService {

	public List<Integer> getYearListForReport();

	public List<Map<String, Object>> getReportListByYear(int year);

	public Map<String, Object> getReportInfoById(int activityId);

	public List<Map<String, Object>> chartForStudentMajor(Integer activityId,
			String type, Integer year);

	public List<Map<String, Object>> chartForStudentSchool(Integer activityId,
			String type, Integer year);

	public List<Map<String, Object>> chartForSchoolArea(Integer activityId,
			String type, Integer year);

	public List<Map<String, Object>> chartForStudentGPA(Integer activityId,
			String type, Integer year);

	public List<Map<String, Object>> chartForStudentRank(Integer activityId,
			String type, Integer year);

	public Map<String, Object> chartForSatisfaction(Integer year);

	public Map<String, Object> querySuggestionListByActivityId(
			Integer activityId);
}
