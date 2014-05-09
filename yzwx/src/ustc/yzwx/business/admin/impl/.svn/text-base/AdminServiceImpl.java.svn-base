package ustc.yzwx.business.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ustc.yzwx.business.admin.AdminService;
import ustc.yzwx.common.core.util.PageResult;
import ustc.yzwx.integration.admin.dao.AdminDao;
import ustc.yzwx.presentation.admin.form.Admin;

/**
 * 系统管理员SERVICE实现类
 * @author zcy
 * @version 1.0.0 2014-2-27
 */
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Override
	public void addAdmin(Admin admin) {
		adminDao.insert(admin);

	}

	@Override
	public PageResult findByPager(int curPage ,int pageSize) {
		
		int start = 0;
		if(curPage >0){
			start = (curPage - 1) * pageSize;
		}else{
			start = 0;
		}
		
		int count = adminDao.countAll();
		
		List<Admin> adminList = adminDao.selectByPager(start,pageSize);
		
		return new PageResult(adminList, count, pageSize, curPage);
	}

	@Override
	public Admin selectByName(String name) {
		return adminDao.selectByName(name);
	}

	@Override
	public int deleteById(int id) {
		int delColumn = adminDao.deleteByPrimaryKey(id);
		return delColumn;
	}

	@Override
	public Admin selectById(int id) {
		return adminDao.selectByPrimaryKey(id);
	}

	@Override
	public int updateById(Admin admin) {
		int column = adminDao.updateByPrimaryKeySelective(admin);
		return column;
	}

}
