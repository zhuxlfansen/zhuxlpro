package ustc.yzwx.business.activity;

import java.util.List;

import unis.base.util.PageResult;
import ustc.yzwx.presentation.activity.form.Activity;

public interface ActivityService {
	
	
	public List<Activity> findAll();
	
	/**
	 * 获取活动列表
	 * @param curPage  当前页数
	 * @param pageSize 一页显示数目
	 * @return 显示pageSize个活动列表
	 */
	public PageResult findAll(String name,int curPage,int pageSize);
	
	/**
	 * 保存一条活动数据
	 * @param activity
	 * @return 1
	 */
	public int save(Activity activity);
	
	/**
	 * 根据id查询活动
	 * @param id 活动id
	 * @return 一条活动数据
	 */
	public Activity findById(int id);
	
	/**
	 * 更新活动
	 * @param activity
	 * @return
	 */
	public int updateActivity(Activity activity);
	
	/**
	 * 删除活动
	 * @param id
	 * @return
	 */
	public int deleteActivity(int id);

}
