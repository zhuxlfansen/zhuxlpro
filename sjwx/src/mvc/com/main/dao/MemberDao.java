package mvc.com.main.dao;

import java.util.Map;

import mvc.com.main.common.integration.dao.annotation.DaoMaster;

@DaoMaster
public interface MemberDao {

	public Integer countByWxCode(String wxCode);
	
	public Map<String,Object> selectIntegralByWxCode(String wxCode);
	
	public void updateIntegral(Map<String,Object> map);
	
	public void createMember(Map<String,Object> map);
}
