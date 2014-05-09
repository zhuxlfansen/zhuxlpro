package ustc.yzwx.business.student.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ustc.yzwx.business.student.SubscribeService;
import ustc.yzwx.integration.student.dao.SubscribeDao;
import ustc.yzwx.presentation.student.form.Subscribe;
@Service
public class SubscribeServiceImpl implements SubscribeService {

	@Autowired
	private SubscribeDao subscribeDao;
	
	@Override
	public int insert(Subscribe record) {
		return subscribeDao.insert(record);
	}

	@Override
	public int insertSelective(Subscribe record) {
		return 0;
	}

	@Override
	public int countByWxCode(String wxCode) {
		return subscribeDao.countByWxCode(wxCode);
	}

	@Override
	public void deleteByWxCode(String wxCode) {
		subscribeDao.deleteByWxCode(wxCode);
		
	}

}
