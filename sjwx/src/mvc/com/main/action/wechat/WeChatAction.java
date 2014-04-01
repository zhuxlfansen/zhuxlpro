package mvc.com.main.action.wechat;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.com.main.common.constants.MessageCode;
import mvc.com.main.common.core.util.FWLogger;
import mvc.com.main.service.wechat.WeChatService;
import mvc.com.wechat.bean.InMessage;
import mvc.com.wechat.bean.OutMessage;
import mvc.com.wechat.bean.TextOutMessage;
import mvc.com.wechat.util.WeChat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


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

	@Autowired
	private FWLogger logger;

	@RequestMapping(value = "/wechat")
	public ModelAndView doWeChat(@RequestBody InMessage inMsg,
			HttpServletRequest request, HttpServletResponse response) {

		String signature = request.getParameter("signature");// 微信加密签名
		String timestamp = request.getParameter("timestamp");// 时间�?
		String nonce = request.getParameter("nonce");// 随机�?

		logger.info("signature = -----------------" + signature);
		logger.info("timestamp = -----------------" + timestamp);
		logger.info("nonce = ---------------------" + nonce);
		logger.info("echostr = -----------------"
				+ request.getParameter("echostr"));

		// 验证信息来源
		if (!WeChat.checkSignature(signature, timestamp, nonce)) {
			// 记录请求的IP
			logger.info("可能恶意IP:" + getIpAddr(request));
			return null;
		}

		// 微信类型取得
		String type = inMsg.getMsgType();

		logger.info("msgType:-------------------" + type);
		logger.info("event:---------------------" + inMsg.getEvent());
		logger.info("eventKey:------------------" + inMsg.getEventKey());
		logger.info("ticket:--------------------" + inMsg.getTicket());

		try {
			Method mt = service.getClass().getMethod(type + "TypeMsg",
					InMessage.class);

			OutMessage outMessage = (OutMessage) mt.invoke(service, inMsg);

			WeChat.beanToXmlStr(outMessage, inMsg, response);
		} catch (Exception e) {
			logger.error(e);
			TextOutMessage outMessage = new TextOutMessage();
			outMessage.setContent(logger.getMessageAccessor().getMessage(
					MessageCode.S000008));
			try {
				WeChat.beanToXmlStr(outMessage, inMsg, response);
			} catch (Exception ie) {
				logger.error(ie);
			}
		}

		return null;
	}

	/**
	 * 获取IP
	 * 
	 * @param request
	 * @return
	 */
	private String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
}
