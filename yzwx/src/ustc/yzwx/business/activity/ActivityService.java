package ustc.yzwx.business.activity;

import java.util.Date;
import java.util.List;

import unis.base.util.PageResult;
import ustc.yzwx.presentation.activity.form.Activity;
import ustc.yzwx.presentation.activity.form.ActivityBoardingInfo;

public interface ActivityService {
	
	
	public List<Activity> findAll(Date date,String type);
	
	/**
	 * 获取活动列表
	 * @param curPage  当前页数
	 * @param pageSize 一页显示数目
	 * @return 显示pageSize个活动列表
	 */
	public PageResult findAll(String name,String type,int curPage,int pageSize);
	
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
	
	/**
	 * ajax查询活动名字是否重复
	 * @param name 活动名称
	 * @return 1，已存在；0，新名称 可用
	 */
	public int ajaxCheckActivityName(String name);
	
	/**
	 * 查询结束日期在一年内的数据
	 * @return
	 */
	public List<Activity> getOneYearActivityList();
	
	public String selectQRCodeBySceneId(Integer sceneId);
	
	public int insertBoardingInfo(ActivityBoardingInfo boardingInfo);
	
	public List<ActivityBoardingInfo> getBoardingsByActivityId(Integer activityId);
	
	public int delBoardingById(int id);
	
	public int updBoardingById(ActivityBoardingInfo boardingInfo);
	
}
