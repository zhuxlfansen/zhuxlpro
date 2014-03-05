package ustc.yzwx.business.student.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ustc.yzwx.business.student.SchoolService;
import ustc.yzwx.integration.student.dao.SchoolDao;
import ustc.yzwx.presentation.student.form.School;

/**
 * 学校SERVICE实现类
 * @author zcy
 * @version 1.0.0 2014-2-22
 */
@Service
public class SchoolServiceImpl implements SchoolService {

	/**
	 * Spring注入Mybatis
	 */
	@Autowired
	private SchoolDao schoolDao;
	
	@Override
	public List<School> selectByPlace(String city) {
		List<School> schoolList = schoolDao.selectByCity(city) ;
		return schoolList;
	}

}
