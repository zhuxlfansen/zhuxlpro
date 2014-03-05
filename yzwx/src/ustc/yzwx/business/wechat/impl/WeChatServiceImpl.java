package ustc.yzwx.business.wechat.impl;

import org.springframework.stereotype.Service;

import ustc.yzwx.business.wechat.WeChatService;
import ustc.yzwx.common.constants.MessageCode;
import ustc.yzwx.wechat.bean.InMessage;
import ustc.yzwx.wechat.bean.OutMessage;
import ustc.yzwx.wechat.bean.TextOutMessage;

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

		outMessage.setContent(messageUtil.getMessage(MessageCode.I000005,
				msg.getContent()));

		return outMessage;
	}

	@Override
	public OutMessage eventTypeMsg(InMessage msg) {

		TextOutMessage outMessage = new TextOutMessage();

		outMessage.setContent(messageUtil.getMessage(MessageCode.I000001));

		return outMessage;
	}
}
