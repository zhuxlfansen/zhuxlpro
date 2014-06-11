package com.zkhy.business.wechat;

import java.util.List;
import java.util.Map;

import com.zkhy.wechat.bean.InMessage;
import com.zkhy.wechat.bean.OutMessage;



/**
 * @author yujie
 *
 */
public interface WeChatService {

	public final static String MSG_TYPE_TEXT = "text";
	public final static String MSG_TYPE_LOCATION = "location";
	public final static String MSG_TYPE_IMAGE = "image";
	public final static String MSG_TYPE_LINK = "link";
	public final static String MSG_TYPE_VOICE = "voice";
	public final static String MSG_TYPE_EVENT = "event";
	
	public final static String MSG_TYPE_NEWS = "news";
	public final static String MSG_TYPE_MUSIC = "music";
	
	/**
	 * 文本类型
	 * @param msg
	 * @return
	 */
	public OutMessage textTypeMsg(InMessage msg);
	
	/**
	 * 地理位置类型
	 * @param msg
	 * @return
	 */
	public OutMessage locationTypeMsg(InMessage msg);
	
	/**
	 * 图像类型
	 * @param msg
	 * @return
	 */
	public OutMessage imageTypeMsg(InMessage msg);
	
	/**
	 * 连接类型
	 * @param msg
	 * @return
	 */
	public OutMessage linkTypeMsg(InMessage msg);
	/**
	 * 声音类型
	 * @param msg
	 * @return
	 */
	public OutMessage voiceTypeMsg(InMessage msg);
	/**
	 * 事件类型
	 * @param msg
	 * @return
	 */
	public OutMessage eventTypeMsg(InMessage msg);
	
	public int checkExistByWechatCode(String wechatCode);
	public Map<String,Object> getUserInfoByUserId(int studentId);
	public int doBind(String wechatCode,int studentId);
	public List<Map<String,Object>> getExamFullList();
	public List<Map<String,Object>> getExamDetail(String wechatCode,int examId);
	public List<Map<String,Object>> getScoreDetail(int scoreId);
}
