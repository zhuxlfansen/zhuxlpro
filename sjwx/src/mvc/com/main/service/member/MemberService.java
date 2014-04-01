package mvc.com.main.service.member;

import java.util.Map;

public interface MemberService {

	public Integer countByWxCode(String wxCode);
	
	public Map<String,Object> selectIntegralByWxCode(String wxCode);
	
	public void updateIntegral(Map<String,Object> map);
	
	public void createMember(Map<String,Object> map);
}
