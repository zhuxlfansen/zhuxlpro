package com.etyy.business.duty.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etyy.business.duty.DutyService;
import com.etyy.integration.duty.dao.DutyDao;

@Service
public class DutyServiceImpl implements DutyService {
	
	@Autowired
	private DutyDao dutyDao;
	
	@Override
	public List<Map<String, Object>> selectDocList() {
		return dutyDao.selectDocList();
	}

	@Override
	public synchronized void doDuty(int id,int apm,String week) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("apm", apm);
		map.put("week", week);
		if (dutyDao.checkExist(map)>0)
			dutyDao.deleteDuty(map);
		else
			dutyDao.insertDuty(map);
	}

	@Override
	public List<Map<String, Object>> selectByExpId(int id) {
		return dutyDao.selectByExpId(id);
	}

	@Override
	public synchronized List<Map<String, Object>> queryDutyList1(int isExp,int nk,int wk,int zk,int qt) {
		Map<String,Object> map = new HashMap<String,Object>();
		if(isExp==1){
			map.put("isExp", 1);
		}
		if(nk==1){
			map.put("nk", 1);
		}
		if(wk==1){
			map.put("wk", 1);
		}
		if(zk==1){
			map.put("zk", 1);
		}
		if(qt==1){
			map.put("qt", 1);
		}
		return dutyDao.queryDutyList1(map);
	}

	@Override
	public List<Map<String, Object>> selectAllDuty() {
		return dutyDao.selectAllDuty();
	}

}
