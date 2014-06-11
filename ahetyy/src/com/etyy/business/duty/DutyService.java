package com.etyy.business.duty;

import java.util.List;
import java.util.Map;

public interface DutyService {

	public List<Map<String,Object>> selectDocList();
	
	public List<Map<String,Object>> selectAllDuty();
	
	public List<Map<String,Object>> queryDutyList1(int isExp,int nk,int wk,int zk,int qt);
	
	public void doDuty(int id,int apm,String week);
	
	public List<Map<String,Object>> selectByExpId(int id);
}
