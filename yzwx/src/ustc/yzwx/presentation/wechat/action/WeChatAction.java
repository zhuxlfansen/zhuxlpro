package ustc.yzwx.presentation.wechat.action;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ustc.yzwx.business.wechat.WeChatService;
import ustc.yzwx.wechat.bean.InMessage;
import ustc.yzwx.wechat.bean.OutMessage;
import ustc.yzwx.wechat.util.WeChat;

/**
 * 微信action
 * 
 * @author user
 * 
 */
@Controller
public class WeChatAction {

	@Autowired
	private WeChatService service;

	@RequestMapping(value = "/wechat")
	public ModelAndView doWeChat(@RequestBody InMessage inMsg,
			HttpServletResponse response) throws Exception {

		// 微信类型取得
		String type = inMsg.getMsgType();

		Method mt = service.getClass().getMethod(type + "TypeMsg",
				InMessage.class);

		OutMessage outMessage = (OutMessage) mt.invoke(service, inMsg);

		WeChat.beanToXmlStr(outMessage, inMsg, response);

		return null;
	}
}
