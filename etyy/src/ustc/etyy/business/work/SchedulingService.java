package ustc.etyy.business.work;

import java.util.Date;
import java.util.List;
import java.util.Map;

import ustc.etyy.common.util.Pager;
import ustc.etyy.presentation.work.form.OrderForm;

public interface SchedulingService {

	public List<Map<String,Object>> queryParentKS();
	
	public List<Map<String,Object>> queryChildKSByPID(int pId);
	
	public List<Map<String,Object>> queryExpert(Integer ksId);
	
	public List<Map<String,Object>> queryParentMZ();
	
	public List<Map<String,Object>> queryChildMZByPID(int pId);
	
	public void createScheduling(Integer eId,Integer apm,Integer week,Integer mzId);
	
	public Map<String,Object> queryMZById(Integer mzId);
	
	public void delScheduling(Integer eId, Integer apm, Integer week);
	
	public List<Map<String,Object>> querySchedulingTable();
	
	public List<Map<String,Object>> queryAllMz();
	
	public List<Map<String,Object>> queryExpertByParam(Date dateSel,Integer apm,Integer mzId);
	
	public void insertOrder(OrderForm orderForm);
	
	public Pager<Map<String,Object>> queryOrderList(Map<String, Object> map, int pageIndex,int pageSize);
}
