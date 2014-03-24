package mvc.com.main.service.wechat.impl;


import mvc.com.main.common.constants.MessageCode;
import mvc.com.main.service.wechat.WeChatService;
import mvc.com.wechat.bean.InMessage;
import mvc.com.wechat.bean.NewsOutMessage;
import mvc.com.wechat.bean.OutMessage;
import mvc.com.wechat.bean.TextOutMessage;
import org.springframework.stereotype.Service;

/**
 * @author user
 * 
 */
@Service
public class WeChatServiceImpl extends DefaultWeChatServiceImpl implements
		WeChatService {

	
	@Override
	public OutMessage textTypeMsg(InMessage msg) {

		TextOutMessage outMessage = new TextOutMessage();

		return outMessage;
	}

	@Override
	public OutMessage eventTypeMsg(InMessage msg) {
		OutMessage outMessage = null;
		return outMessage;
	}

	/**
	 * 查询参加的活动列表并回复给用户
	 * 
	 * @param msg
	 *            接收用户信息
	 * @return 返回news信息
	 */
	public OutMessage partakeRecordClick(InMessage msg) {
		NewsOutMessage outMessage = new NewsOutMessage();
		
		return outMessage;
	}

	/**
	 * 默认事件
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage defaultEvent(InMessage msg) {
		TextOutMessage outMessage = new TextOutMessage();
		outMessage.setContent(messageUtil.getMessage(MessageCode.I000001,
				msg.getContent()));
		return outMessage;
	}

	/**
	 * 关注事件 + 未关注时的二维码扫描事件
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage subscribeEvent(InMessage msg) {
		// 返回信息
		TextOutMessage outMessage = new TextOutMessage();

		return outMessage;
	}

	/**
	 * 取消关注事件
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage unsubscribeEvent(InMessage msg) {
		
		TextOutMessage outMessage = new TextOutMessage();
		outMessage.setContent(messageUtil.getMessage(MessageCode.I000001,
				msg.getContent()));
		return outMessage;
	}


}
