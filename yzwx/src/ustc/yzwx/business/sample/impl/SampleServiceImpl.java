package ustc.yzwx.business.sample.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ustc.yzwx.business.sample.SampleService;
import ustc.yzwx.integration.sample.dao.SampleDao;
import ustc.yzwx.presentation.sample.form.SampleForm;

@Service
public class SampleServiceImpl implements SampleService {

	@Autowired
	private SampleDao sampleDao;

	@Override
	public List<SampleForm> search(String code) {
		return sampleDao.search(code);
	}
}
