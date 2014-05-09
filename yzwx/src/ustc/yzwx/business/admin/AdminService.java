package ustc.yzwx.business.admin;

import ustc.yzwx.common.core.util.PageResult;
import ustc.yzwx.presentation.admin.form.Admin;

/**
 * 系统管理员SERVICE
 * @author zcy
 * @version 1.0.0 2014-2-27
 */
public interface AdminService {
	
	/**
	 * 增加系统管理员
	 * @param admin
	 */
	void addAdmin(Admin admin);
	
	/**
	 * 按页查系统管理员列表
	 * @return PageResult
	 */
	PageResult findByPager(int curPage ,int pageSize);
	
	/**
     * 根据管理员名查管理员
     * @param name
     * @return Admin
     */
    Admin selectByName(String name);

    /**
     * 根据ID删除
     * @param id
     * @return int
     */
    int deleteById(int id);
    
    /**
     * 根据ID查询
     * @param id
     * @return Admin
     */
    Admin selectById(int id);
    
    /**
     * 根据ID更新
     * @param admin
     * @return int
     */
    int updateById(Admin admin);
}
