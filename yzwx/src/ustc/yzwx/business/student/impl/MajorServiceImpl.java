package ustc.yzwx.business.student.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ustc.yzwx.business.student.MajorService;
import ustc.yzwx.integration.student.dao.MajorDao;
import ustc.yzwx.presentation.student.form.Major;

/**
 * 专业SERVICE实现类
 * @author zcy
 * @version 1.0.0 2014-2-26
 */
@Service
public class MajorServiceImpl implements MajorService {

	/**
	 * Spring注入的MajorDao
	 */
	@Autowired
	private MajorDao majorDao;
	
	@Override
	public List<Major> selectByParentCode(String parentCode) {
		
		return majorDao.selectByParentCode(parentCode);
	}

	@Override
	public List<Major> getAllMajor() {
		return majorDao.getAllMajor();
	}

}
