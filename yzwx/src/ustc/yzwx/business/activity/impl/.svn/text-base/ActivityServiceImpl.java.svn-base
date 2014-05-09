package ustc.yzwx.business.activity.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import unis.base.util.PageResult;
import unis.base.util.ValidateUtil;
import ustc.yzwx.business.activity.ActivityService;
import ustc.yzwx.common.constants.Constants;
import ustc.yzwx.integration.activity.dao.ActivityDao;
import ustc.yzwx.integration.partakeRecord.dao.PartakeRecordDao;
import ustc.yzwx.presentation.activity.form.Activity;
import ustc.yzwx.presentation.activity.form.ActivityBoardingInfo;
import ustc.yzwx.wechat.util.AdvancedUtil;
import ustc.yzwx.wechat.util.WeChat;

@Service
public class ActivityServiceImpl implements ActivityService {

	@Autowired
	private ActivityDao activityDao;
	@Autowired
	private PartakeRecordDao partakeRecordDao;

	@Override
	public List<Activity> findAll(Date date,String type) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("nowTime", new Date());
		map.put("type", type);
		return activityDao.findAll(map);
	}
	
	

	@Override
	public PageResult findAll(String name,String type, int curPage, int pageSize) {
		int applyCount = 0;
		int signCount = 0;
		int totalCount = 0;
		int offset = _topage(curPage, pageSize);
		int count = activityDao.totalCount(name);
		
		List<Activity> actList = activityDao.findall(name, type, offset, pageSize);
		if (ValidateUtil.isNotEmpty(actList)) {
			for (Activity activity : actList) {
				signCount = partakeRecordDao.getStuCountByActivityAndStatus(
						activity.getId(),
						Constants.ActivityStatusSet.STATUS_APPLY);
				totalCount = partakeRecordDao.getStuCountByActivityAndStatus(
						activity.getId(),
						Constants.ActivityStatusSet.STATUS_TOTAL);
				activity.setApplyCount(applyCount);
				activity.setSignCount(signCount);
				activity.setTotalCount(totalCount);
			}
		}
		return new PageResult(actList, count, pageSize, curPage);
	}

	private int _topage(int curPage, int pageSize) {
		int offset = 0;
		if (curPage > 0) {
			offset = (curPage - 1) * pageSize;
		} else {
			offset = 0;
		}
		return offset;
	}

	@Override
	public int save(Activity activity) {
		int i=activityDao.insertSelective(activity);
		Map<String,Object> map =new HashMap<String,Object>();
		//生成报名ticket
		String bmTicket = AdvancedUtil.createPermanentQRCode(WeChat.getAccessToken(), Integer.parseInt("1"+activity.getId()));
		map.put("sceneId", "1"+activity.getId());
		map.put("ticket", bmTicket);
		activityDao.insertQRCode(map);
		
		//生成签到ticket
		String qdTicket = AdvancedUtil.createPermanentQRCode(WeChat.getAccessToken(), Integer.parseInt("2"+activity.getId()));
		map =new HashMap<String,Object>();
		map.put("sceneId", "2"+activity.getId());
		map.put("ticket", qdTicket);
		activityDao.insertQRCode(map);
		return i;
	}

	@Override
	public Activity findById(int id) {
		return activityDao.selectByPrimaryKey(id);
	}

	@Override
	public int updateActivity(Activity activity) {
		return activityDao.updateByPrimaryKeySelective(activity);
	}

	@Override
	public int deleteActivity(int id) {
		activityDao.deleteQRCode(Integer.valueOf("1" + id));
		activityDao.deleteQRCode(Integer.valueOf("2" + id));
		return activityDao.deleteByPrimaryKey(id);
	}

	@Override
	public int ajaxCheckActivityName(String name) {
		return activityDao.findCountByName(name, null);
	}

	@Override
	public String selectQRCodeBySceneId(Integer sceneId) {
		return activityDao.selectQRCodeBySceneId(sceneId);
	}

	@Override
	public int insertBoardingInfo(ActivityBoardingInfo boardingInfo) {
		return activityDao.insertBoardingInfo(boardingInfo);
	}

	@Override
	public int delBoardingById(int id) {
		return activityDao.delBoardingById(id);
	}

	@Override
	public List<ActivityBoardingInfo> getBoardingsByActivityId(
			Integer activityId) {
		List<ActivityBoardingInfo> list =activityDao.getBoardingsByActivityId(activityId);
		for(ActivityBoardingInfo ab:list){
			ab.setTotalStu(activityDao.countTotalStu(ab));
		}
		return list;
	}

	@Override
	public int updBoardingById(ActivityBoardingInfo boardingInfo) {
		return activityDao.updBoardingById(boardingInfo);
	}



	@Override
	public List<Activity> getOneYearActivityList() {
		return activityDao.getOneYearActivityList();
	}

}
