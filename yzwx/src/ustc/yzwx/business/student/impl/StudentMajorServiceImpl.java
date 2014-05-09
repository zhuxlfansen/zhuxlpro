package ustc.yzwx.business.student.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ustc.yzwx.business.student.StudentMajorService;
import ustc.yzwx.integration.student.dao.StudentMajorDao;
import ustc.yzwx.presentation.student.form.StudentMajor;

/**
 * 考生专业关联表SERVICE实现类
 * 
 * @author zcy
 * @version 1.0.0 2014-3-28
 */
@Service
public class StudentMajorServiceImpl implements StudentMajorService {

	@Autowired
	private StudentMajorDao studentMajorDao;

	@Override
	public void addList(String[] majorCodes, int studentId) {

		if (majorCodes != null && majorCodes.length > 0) {

			StudentMajor sm = new StudentMajor();
			sm.setStudentId(studentId);

			for (String majorCode : majorCodes) {
				sm.setMajorCode(majorCode);
				studentMajorDao.insert(sm);
			}
		}

	}

	@Override
	public void updateByStudentId(String[] majorCodes, int studentId) {
		studentMajorDao.deleteByStudentId(studentId);

		if (majorCodes != null && majorCodes.length > 0) {

			StudentMajor sm = new StudentMajor();
			sm.setStudentId(studentId);

			for (String majorCode : majorCodes) {
				sm.setMajorCode(majorCode);
				studentMajorDao.insert(sm);
			}
		}
	}

	@Override
	public List<Map<String, Object>> selectByStudentId(int studentId) {
		return studentMajorDao.selectByStudentId(studentId);
	}

}
