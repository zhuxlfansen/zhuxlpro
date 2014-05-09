package ustc.yzwx.business.student;

import java.util.List;
import java.util.Map;

/**
 * 考生专业关联表SERVICE
 * @author zcy
 * @version 1.0.0 2014-3-28
 */
public interface StudentMajorService {
	
	/**
	 * 添加一个List
	 * @param studengMajorList
	 */
	void addList(String[] majorCodes ,int studentId);
	
	/**
	 * 根据考生ID更新
	 * @param majorCodes
	 * @param studentId
	 */
	void updateByStudentId(String[] majorCodes ,int studentId);
	
	/**
     * 根据考生ID查报考专业
     * @param studentId
     * @return List
     */
    List<Map<String,Object>> selectByStudentId(int studentId);
	
}
