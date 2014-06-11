package com.zkhy.business.wechat.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zkhy.business.wechat.WeChatService;
import com.zkhy.common.core.util.FWLogger;
import com.zkhy.integration.wechat.dao.WechatDao;
import com.zkhy.wechat.bean.Articles;
import com.zkhy.wechat.bean.InMessage;
import com.zkhy.wechat.bean.NewsOutMessage;
import com.zkhy.wechat.bean.OutMessage;
import com.zkhy.wechat.bean.TextOutMessage;
import com.zkhy.wechat.util.WeChatConfig;




/**
 * @author user
 * 
 */
@Service
public class WeChatServiceImpl extends DefaultWeChatServiceImpl implements
		WeChatService {

	@Autowired
	private FWLogger logger;
	@Autowired
	private WechatDao wechatDao;
	
	@Override
	public OutMessage textTypeMsg(InMessage msg) {

		TextOutMessage outMessage = new TextOutMessage();


		return outMessage;
	}


	@Override
	public OutMessage eventTypeMsg(InMessage msg) {
		OutMessage outMessage = null;
		System.out.println("========================event:"+msg.getEvent());
		if (msg.getEvent().equals("CLICK")) {						// 处理CLICK事件
			if (msg.getEventKey().equals("score")) {				// 处理“查询成绩”事件
				outMessage = this.scoreSearch(msg);
			} else if (msg.getEventKey().equals("evaluate")) {		// 处理“学期评论”事件
				outMessage = this.defaultEvent(msg);
			} else if (msg.getEventKey().equals("chart")) {			// 处理“统计分析”事件
				outMessage = this.defaultEvent(msg);
			} else {												// 处理默认事件
				outMessage = this.defaultEvent(msg);
			}
		} else if (msg.getEvent().equals("subscribe")) {			// 处理“关注”事件
			outMessage = this.subscribeEvent(msg);
		}  else{													// 处理默认事件
			outMessage = this.defaultEvent(msg);
		}
		return outMessage;
	}

	public OutMessage subscribeEvent(InMessage msg) {
		// 返回信息
		TextOutMessage outMessage = new TextOutMessage();
		String content ="你好，欢迎关注瀚云微成绩！请点击菜单获取更多服务！";
		if(this.wechatDao.checkExistByWechatCode(msg.getFromUserName())==0){
			content+="\n您尚未绑定学生账号，<a href='http://"+WeChatConfig.getProperty("site_url")+"/mob/toBind?wechatCode="+msg.getFromUserName()+"'>请点击此处进行绑定！</a>";
		}
		
		outMessage.setContent(content);
		//count为null代表第一次关注
		return outMessage;
	}
	
	
	public OutMessage scoreSearch(InMessage msg) {
		if(this.wechatDao.checkExistByWechatCode(msg.getFromUserName())==0){
			TextOutMessage outMessage = new TextOutMessage();
			String content ="您尚未绑定学生账号，<a href='http://"+WeChatConfig.getProperty("site_url")+"/mob/toBind?wechatCode="+msg.getFromUserName()+"'>请点击此处进行绑定！</a>";
			outMessage.setContent(content);
			//count为null代表第一次关注
			return outMessage;
		}else{
			List<Map<String,Object>> mapList = this.wechatDao.getExamList();
			if(mapList.size()>0){
				NewsOutMessage outMessage = new NewsOutMessage();
				List<Articles> list = new ArrayList<Articles>();
				Articles article = new Articles();
				article.setTitle("最近考试");
				article.setDescription("");
				article.setPicUrl("http://"+WeChatConfig.getProperty("site_url")+"/static/commonImg/top_score.jpg");
				article.setUrl("");
				list.add(article);
				for(Map<String,Object> m:mapList){
					article = new Articles();
					article.setTitle((String)m.get("examName"));
					article.setDescription("");
					article.setPicUrl("");
					article.setUrl("http://"+WeChatConfig.getProperty("site_url")+"/mob/examDetail?examId="+(Integer) m.get("examId")+"&wechatCode="+msg.getFromUserName());
					list.add(article);
				}
				outMessage.setArticles(list);
				return outMessage;
			}else{
				TextOutMessage outMessage = new TextOutMessage();
				outMessage.setContent("暂无可查询考试！");
				return outMessage;
			}
		}
	}
	
	/**
	 * 默认事件
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage defaultEvent(InMessage msg) {
		TextOutMessage outMessage = new TextOutMessage();
		outMessage.setContent("本功能暂时未开放，请体验其他功能！");
		return outMessage;
	}

	@Override
	public OutMessage locationTypeMsg(InMessage msg) {
		return null;
	}


	@Override
	public OutMessage imageTypeMsg(InMessage msg) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public OutMessage linkTypeMsg(InMessage msg) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public OutMessage voiceTypeMsg(InMessage msg) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public int checkExistByWechatCode(String wechatCode){
		return this.wechatDao.checkExistByWechatCode(wechatCode);
	}


	@Override
	public Map<String, Object> getUserInfoByUserId(int studentId) {
		return this.wechatDao.getUserInfoByUserId(studentId);
	}


	@Override
	public int doBind(String wechatCode, int studentId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("wechatCode", wechatCode);
		map.put("studentId",studentId);
		return this.wechatDao.doBind(map);
	}


	@Override
	public List<Map<String, Object>> getExamDetail(String wechatCode,int examId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("wechatCode", wechatCode);
		map.put("examId",examId);
		return this.wechatDao.getExamDetail(map);
	}


	@Override
	public List<Map<String, Object>> getExamFullList() {
		return this.wechatDao.getExamFullList();
	}


	@Override
	public List<Map<String, Object>> getScoreDetail(int scoreId) {
		return this.wechatDao.getScoreDetail(scoreId);
	}

}
