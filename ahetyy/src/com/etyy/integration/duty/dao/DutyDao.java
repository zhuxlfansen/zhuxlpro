package com.etyy.integration.duty.dao;


import java.util.List;
import java.util.Map;

import com.etyy.common.integration.dao.annotation.DaoMaster;


@DaoMaster
public interface DutyDao {

	public List<Map<String,Object>> selectDocList();
	
	public List<Map<String,Object>> selectAllDuty();
	
	public List<Map<String,Object>> queryDutyList1(Map<String,Object> map);
	
	public List<Map<String,Object>> selectByExpId(int id);
	
	public int checkExist(Map<String,Object> map);
	
	public void insertDuty(Map<String,Object> map);
	
	public void deleteDuty(Map<String,Object> map);
}
