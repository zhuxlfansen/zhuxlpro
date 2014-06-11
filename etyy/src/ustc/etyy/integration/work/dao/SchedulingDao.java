package ustc.etyy.integration.work.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import ustc.etyy.common.integration.dao.annotation.DaoMaster;
import ustc.etyy.presentation.work.form.OrderForm;

@DaoMaster
public interface SchedulingDao {
	
	public List<Map<String,Object>> queryParentKS();
	
	public List<Map<String,Object>> queryChildKSByPID(int pId);
	
	public List<Map<String,Object>> queryExpert(Integer ksId);
	
	public List<Map<String,Object>> queryParentMZ();
	
	public List<Map<String,Object>> queryChildMZByPID(int pId);
	
	public void createScheduling(Map<String,Object> map);
	
	public void delScheduling(Map<String,Object> map);
	
	public Map<String,Object> queryMZById(Integer mzId);
	
	public Map<String,Object> querySchedulingByParm(@Param("eId") int eId,@Param("week") int week,@Param("apm") int apm);
	
	public List<Map<String,Object>> querySchedulingTable();
	
	public List<Map<String,Object>> queryAllMz();
	
	public List<Map<String,Object>> queryExpertByParam(Map<String,Object> map);

	public void insertOrder(OrderForm orderForm);
	
	public List<Map<String,Object>> queryOrderList(Map<String,Object> map);
	
	public int countOrderList(Map<String,Object> map);
}
