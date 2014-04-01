package mvc.com.main.service.member.impl;

import java.util.Map;

import mvc.com.main.dao.MemberDao;
import mvc.com.main.service.member.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Override
	public Integer countByWxCode(String wxCode) {
		// TODO Auto-generated method stub
		return memberDao.countByWxCode(wxCode);
	}

	@Override
	public Map<String,Object> selectIntegralByWxCode(String wxCode) {
		// TODO Auto-generated method stub
		return memberDao.selectIntegralByWxCode(wxCode);
	}

	@Override
	public void updateIntegral(Map<String, Object> map) {
		memberDao.updateIntegral(map);
	}

	@Override
	public void createMember(Map<String, Object> map) {
		memberDao.createMember(map);
	}

}
