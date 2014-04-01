package mvc.com.main.service.wechat;

import mvc.com.wechat.bean.InMessage;
import mvc.com.wechat.bean.OutMessage;


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
}
