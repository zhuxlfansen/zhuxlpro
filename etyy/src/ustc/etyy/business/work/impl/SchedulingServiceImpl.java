package ustc.etyy.business.work.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ustc.etyy.business.work.SchedulingService;
import ustc.etyy.common.util.Pager;
import ustc.etyy.integration.work.dao.SchedulingDao;
import ustc.etyy.presentation.work.form.OrderForm;

@Service
public class SchedulingServiceImpl implements SchedulingService {

	@Autowired
	private SchedulingDao schedulingDao;

	@Override
	public List<Map<String, Object>> queryParentKS() {
		return schedulingDao.queryParentKS();
	}

	@Override
	public List<Map<String, Object>> queryChildKSByPID(int pId) {
		return schedulingDao.queryChildKSByPID(pId);
	}

	@Override
	public List<Map<String, Object>> queryExpert(Integer ksId) {
		List<Map<String,Object>> mapList = schedulingDao.queryExpert(ksId);
		List<Map<String,Object>> mList = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = null;
		for(Map<String,Object> m:mapList){
			map=new HashMap<String,Object>();
			map=m;
			map.put("s10", this.til(Integer.parseInt(map.get("eId")+""), 1, 0));
			map.put("s11", this.til(Integer.parseInt(map.get("eId")+""), 1, 1));
			map.put("s20", this.til(Integer.parseInt(map.get("eId")+""), 2, 0));
			map.put("s21", this.til(Integer.parseInt(map.get("eId")+""), 2, 1));
			map.put("s30", this.til(Integer.parseInt(map.get("eId")+""), 3, 0));
			map.put("s31", this.til(Integer.parseInt(map.get("eId")+""), 3, 1));
			map.put("s40", this.til(Integer.parseInt(map.get("eId")+""), 4, 0));
			map.put("s41", this.til(Integer.parseInt(map.get("eId")+""), 4, 1));
			map.put("s50", this.til(Integer.parseInt(map.get("eId")+""), 5, 0));
			map.put("s51", this.til(Integer.parseInt(map.get("eId")+""), 5, 1));
			map.put("s60", this.til(Integer.parseInt(map.get("eId")+""), 6, 0));
			map.put("s61", this.til(Integer.parseInt(map.get("eId")+""), 6, 1));
			map.put("s70", this.til(Integer.parseInt(map.get("eId")+""), 7, 0));
			map.put("s71", this.til(Integer.parseInt(map.get("eId")+""), 7, 1));
			mList.add(map);
		}
		return mList;
	}
	
	private String til(int eId,int week,int apm){
		Map<String,Object> map=schedulingDao.querySchedulingByParm(eId, week, apm);
		if(map!=null){
			return map.get("pmzName")+"<br/>（"+map.get("mzName")+"）";
		}else{
			return "";
		}
	}

	@Override
	public List<Map<String, Object>> queryParentMZ() {
		return schedulingDao.queryParentMZ();
	}

	@Override
	public List<Map<String, Object>> queryChildMZByPID(int pId) {
		return schedulingDao.queryChildMZByPID(pId);
	}

	@Override
	public void createScheduling(Integer eId, Integer apm, Integer week,
			Integer mzId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("eId", eId);
		map.put("apm", apm);
		map.put("week", week);
		map.put("mzId", mzId);
		schedulingDao.delScheduling(map);
		schedulingDao.createScheduling(map);
	}

	@Override
	public Map<String,Object> queryMZById(Integer mzId) {
		return schedulingDao.queryMZById(mzId);
	}

	@Override
	public void delScheduling(Integer eId, Integer apm, Integer week) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("eId", eId);
		map.put("apm", apm);
		map.put("week", week);
		schedulingDao.delScheduling(map);
	}

	@Override
	public List<Map<String, Object>> querySchedulingTable() {
		return schedulingDao.querySchedulingTable();
	}

	@Override
	public List<Map<String, Object>> queryAllMz() {
		return schedulingDao.queryAllMz();
	}

	@Override
	public void insertOrder(OrderForm orderForm) {
		schedulingDao.insertOrder(orderForm);
	}

	@Override
	public List<Map<String, Object>> queryExpertByParam(Date dateSel,Integer apm,Integer mzId) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("apm", apm);
		map.put("mzId", mzId);
		Calendar calendar = Calendar.getInstance();//获得一个日历
	    calendar.set(dateSel.getYear(),dateSel.getMonth()-1,dateSel.getDay());//设置当前时间,月份是从0月开始计算
	    int week = calendar.get(Calendar.DAY_OF_WEEK)-1;//星期表示1-7，是从星期日开始，   
	    map.put("week", week);
		return schedulingDao.queryExpertByParam(map);
	}

	@Override
	public Pager<Map<String, Object>> queryOrderList(Map<String, Object> map,
			int pageIndex, int pageSize) {
		map.put("start", (pageIndex-1)*pageSize);
		map.put("size", pageSize);
		int count = schedulingDao.countOrderList(map);
		List<Map<String, Object>> list = schedulingDao.queryOrderList(map);
		return new Pager<Map<String, Object>>(count,pageIndex,pageSize,list);
	}
	
}
