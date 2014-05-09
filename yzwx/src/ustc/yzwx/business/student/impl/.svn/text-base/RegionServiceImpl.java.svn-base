package ustc.yzwx.business.student.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ustc.yzwx.business.student.RegionService;
import ustc.yzwx.integration.student.dao.RegionDao;
import ustc.yzwx.presentation.student.form.Region;

/**
 * 城市SERVICE实现类
 * @author zcy
 * @version 1.0.0 2014-2-26
 */
@Service
public class RegionServiceImpl implements RegionService {

	/**
	 * spring注入的RegionDao
	 */
	@Autowired
	private RegionDao regionDao;
	
	@Override
	public List<Region> getProvince() {
		return regionDao.getProvince();
	}

	@Override
	public List<Region> getCity(int parentId) {
		return regionDao.getCity(parentId);
	}

}
