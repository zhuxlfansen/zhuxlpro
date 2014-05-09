package ustc.yzwx.business.student.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import unis.base.util.PageResult;
import unis.base.util.StringUtil;
import unis.base.util.ValidateUtil;
import ustc.yzwx.business.student.StudentService;
import ustc.yzwx.integration.student.dao.StudentDao;
import ustc.yzwx.integration.student.dao.seachObj.StudentSeachObj;
import ustc.yzwx.presentation.student.form.Student;

/**
 * 考生SERVICE 实现类
 * @author zcy
 * @version 1.0.0 2014-2-18
 */
@Service
public class StudentServiceImpl implements StudentService {

	/**
	 * Spring 注入  StudentDao
	 */
	@Autowired
	private StudentDao studentDao;

	/**
	 * 根据考生ID查询
	 */
	@Override
	public Student selectByPrimaryKey(int id) {
		return studentDao.selectByPrimaryKey(id);
	}
	
	@Override
	public PageResult findByActivity(String activityId,int curPage , int pageSize) {
		int offset = _getOfset(curPage, pageSize);
		int count = studentDao.totalCountByActivity(activityId);
		List<Student> stuList = studentDao.findByActivity(activityId,offset,pageSize);
		
		return new PageResult(stuList, count, pageSize, curPage);
	}

	private int _getOfset(int curPage, int pageSize) {
		int offset = 0;
		if(curPage >0){
			offset = (curPage - 1) * pageSize;
		}else{
			offset = 0;
		}
		return offset;
	}
	
	@Override
	public void addStudent(Student student){
		studentDao.insertSelective(student);
	}

	@Override
	public PageResult findByParams(String activityId, String majorCode,
			String provinceId,String name, int curPage, int pageSize) {
		StudentSeachObj obj = new StudentSeachObj();
		if(ValidateUtil.isNotNull(activityId)){
			obj.activityId=StringUtil.parseInteger(activityId);
		}
		if(ValidateUtil.isNotNull(majorCode)){
			obj.majorCode=majorCode;
		}
		if(ValidateUtil.isNotNull(provinceId)){
			obj.provinceId = provinceId;
		}
		if(ValidateUtil.isNotNull(name)){
			obj.name = name;
		}
		
		obj.offset = _getOfset(curPage, pageSize);
		obj.limit = pageSize;
		int count  = studentDao.countByParams(obj);
		List<Student> stuList = studentDao.findByParams(obj);
		return new PageResult(stuList, count, pageSize, curPage);
	}

	@Override
	public int addStudentSelective(Student student) {
		return studentDao.insertSelective(student);
	}

	@Override
	public Student selectByWxCode(String wxCode) {
		return studentDao.selectByWxCode(wxCode);
	}

	@Override
	public int updateByPrimaryKeySelective(Student record) {
		int column = studentDao.updateByPrimaryKeySelective(record);
		return column;
	}

	@Override
	public List<Map<String, Object>> selectStudentListByParam(
			Integer activityId) {
		//获取学生列表
		List<Map<String,Object>> mapList = studentDao.selectStudentListByParam(activityId);
		List<String> sList = null;
		Map<String,Object> m = null;
		//查询所有已签到的考生
		for(Map<String,Object> map:mapList){
			m = new HashMap<String,Object>();
			m.put("studentId", map.get("studentId"));
			m.put("partakeStatus", "signed");
			//根据学生ID查询参与活动的名称
			sList = studentDao.selectActivitysByStudentId(m);
			String activityName="";
			if(sList.size()>0){
				for(String s:sList){
					activityName+=s+";";
				}
			}else{
				activityName="暂无活动";
			}
			map.put("activityQDList", activityName);
			sList.clear();
			//根据学生ID查询所有拟报考专业
			sList = studentDao.selectMajorsByStudentId((Integer)map.get("studentId"));
			String majorName="";
			if(sList.size()>0){
				for(String s:sList){
					majorName=s+";";
				}
			}else{
				majorName="暂无拟报考专业";
			}
			map.put("majorList", majorName);
		}
		return mapList;
	}

	@Override
	public List<Map<String, Object>> selectAllStudent() {
		List<Map<String,Object>> mapList = studentDao.selectAllStudent();
		Map<String,Object> m=null;
		List<String> sList = null;
		for(Map<String,Object> map:mapList){
			m = new HashMap<String,Object>();
			m.put("studentId", map.get("studentId"));
			//根据学生ID查询报名活动的名称
			sList = studentDao.selectActivitysByStudentId(m);
			String activityName="";
			if(sList.size()>0){
				for(String s:sList){
					activityName+=s+";";
				}
			}else{
				activityName="暂无已报名活动";
			}
			map.put("activityBMList", activityName);
			sList.clear();
			
			//根据学生ID查询签到活动的名称
			m.put("partakeStatus", "signed");
			sList = studentDao.selectActivitysByStudentId(m);
			activityName="";
			if(sList.size()>0){
				for(String s:sList){
					activityName+=s+";";
				}
			}else{
				activityName="暂无已签到活动";
			}
			map.put("activityQDList", activityName);
			sList.clear();
			
			//根据学生ID查询所有拟报考专业
			sList = studentDao.selectMajorsByStudentId((Integer)map.get("studentId"));
			String majorName="";
			if(sList.size()>0){
				for(String s:sList){
					majorName+=s+";";
				}
			}else{
				majorName="暂无拟报考专业";
			}
			map.put("majorList", majorName);
		}
		return mapList;
	}

	@Override
	public int checkExistByIdCardNum(String idCardNum) {
		return studentDao.checkExistByIdCardNum(idCardNum);
	}

}
