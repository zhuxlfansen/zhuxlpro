package com.zkhy.integration.wechat.dao;

import java.util.List;
import java.util.Map;

import com.zkhy.common.integration.dao.annotation.DaoMaster;

@DaoMaster
public interface WechatDao {

	public int checkExistByWechatCode(String wechatCode);
	
	public Map<String,Object> getUserInfoByUserId(int studentId);
	
	public int doBind(Map<String,Object> map);
	
	public List<Map<String,Object>> getExamList();
	
	public List<Map<String,Object>> getExamFullList();
	
	public List<Map<String,Object>> getExamDetail(Map<String,Object> map);
	
	public List<Map<String,Object>> getScoreDetail(int scoreId);
}
