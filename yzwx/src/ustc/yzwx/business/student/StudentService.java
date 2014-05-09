package ustc.yzwx.business.student;

import java.util.List;
import java.util.Map;

import unis.base.util.PageResult;
import ustc.yzwx.presentation.student.form.Student;

/**
 * 考生SERVICE
 * @author zcy
 * @version 1.0.0 2014-2-18
 */

public interface StudentService {
	
	/**
	 * 根据ID查询考生
	 * @param id
	 * @return Student
	 */
	public Student selectByPrimaryKey(int id);
	
	/**
	 * 根据活动id 查询该活动下的考生，若为空，查询所有考生
	 * @param activityId  活动id
	 * @param curPage 当前页数
	 * @param pageSize 一页显示数
	 * @return 
	 */
	public PageResult findByActivity(String activityId,int curPage , int pageSize);
	
	/**
	 * 联合查询考生
	 * @param activityId  活动id
	 * @param majorCode   专业id
	 * @param provinceId  考生学校所属省份id
	 * @param curPage     当前页
	 * @param pageSize    一页显示数
	 * @return   
	 */
	public PageResult findByParams(String activityId,String majorCode,String provinceId, String name ,int curPage , int pageSize);
	
	/**
	 * 增加一个考生
	 * @param student
	 */
	void addStudent(Student student);
	
	/**
	 * 增加一个考生（先判断各个属性是否为空
	 * @param student
	 */
	int addStudentSelective(Student student);
	
	/**
	 * 根据考生wxCode查考生
	 * @param wxCode
	 * @return student
	 */
	Student selectByWxCode(String wxCode);
	
	/**
	 * 根据ID更新考生信息
	 * @param record
	 * @return
	 */
	int updateByPrimaryKeySelective(Student record);
	
	public List<Map<String,Object>> selectStudentListByParam(Integer activityId);
	
	public List<Map<String,Object>> selectAllStudent();
	
	public int checkExistByIdCardNum(String idCardNum);
}
