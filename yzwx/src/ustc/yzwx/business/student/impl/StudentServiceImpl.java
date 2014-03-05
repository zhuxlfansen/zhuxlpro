package ustc.yzwx.business.student.impl;

import java.util.List;

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
			String provinceId, int curPage, int pageSize) {
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
		obj.offset = _getOfset(curPage, pageSize);
		obj.limit = pageSize;
		int count  = studentDao.countByParams(obj);
		List<Student> stuList = studentDao.findByParams(obj);
		return new PageResult(stuList, count, pageSize, curPage);
	}

}
