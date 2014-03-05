package ustc.yzwx.business.activity.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import unis.base.util.PageResult;
import unis.base.util.ValidateUtil;
import ustc.yzwx.business.activity.ActivityService;
import ustc.yzwx.common.constants.Constants;
import ustc.yzwx.integration.activity.dao.ActivityDao;
import ustc.yzwx.integration.partakeRecord.dao.PartakeRecordDao;
import ustc.yzwx.presentation.activity.form.Activity;
import ustc.yzwx.presentation.student.form.Student;

@Service
public class ActivityServiceImpl implements ActivityService {
	
	@Autowired
	private ActivityDao activityDao;
	@Autowired
	private PartakeRecordDao partakeRecordDao;
	

	@Override
	public List<Activity> findAll() {
		return activityDao.findAll();
	}

	@Override
	public PageResult findAll(String name,int curPage, int pageSize) {
		int applyCount = 0;
		int signCount =0;
		int totalCount = 0;
		int offset = _topage(curPage, pageSize);
		int count = activityDao.totalCount(name);
		List<Activity> actList = activityDao.findall(name,offset,pageSize);
		if(ValidateUtil.isNotEmpty(actList)){
			for(Activity activity :actList){
				applyCount = partakeRecordDao.getStuCountByActivityAndStatus(activity.getId(),Constants.ActivityStatusSet.STATUS_APPLY);
				signCount = partakeRecordDao.getStuCountByActivityAndStatus(activity.getId(),Constants.ActivityStatusSet.STATUS_SIGN);
				totalCount = partakeRecordDao.getStuCountByActivityAndStatus(activity.getId(),Constants.ActivityStatusSet.STATUS_TOTAL);
				activity.setApplyCount(applyCount);
				activity.setSignCount(signCount);
				activity.setTotalCount(totalCount);
			}
		}
		return new PageResult(actList, count, pageSize, curPage);
	}

	private int _topage(int curPage, int pageSize) {
		int offset = 0;
		if(curPage >0){
			offset = (curPage - 1) * pageSize;
		}else{
			offset = 0;
		}
		return offset;
	}

	@Override
	public int save(Activity activity) {
		return activityDao.insertSelective(activity);
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
		return activityDao.deleteByPrimaryKey(id);
	}

}
