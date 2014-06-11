package ustc.etyy.wechat.util;


import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import ustc.etyy.common.core.util.FWLogger;
import ustc.etyy.wechat.bean.Articles;
import ustc.etyy.wechat.bean.InMessage;
import ustc.etyy.wechat.bean.OutMessage;

import com.thoughtworks.xstream.XStream;

/**
 * ΢�ų���API
 * 
 * @author user
 * 
 */
public class WeChat {

	private static final FWLogger LOGGER = new FWLogger();
	private static final String ACCESSTOKEN_URL = WeChatConfig
			.getProperty("ACCESSTOKEN_URL");
	private static final String PAYFEEDBACK_URL = WeChatConfig
			.getProperty("PAYFEEDBACK_URL");

	/**
     * 获取access_token
     *
     * @param @return 设定文件
     * @return String    返回类型
     * @throws
     */
	public static String getAccessToken() {
		String appid = WeChatConfig.getProperty("AppId");
		String secret = WeChatConfig.getProperty("AppSecret");
		String jsonStr = HttpKit.get(ACCESSTOKEN_URL.concat("&appid=") + appid
				+ "&secret=" + secret);
		JSONObject jsonObject = JSONObject.fromObject(jsonStr);
		return jsonObject.getString("access_token");
	}

	/**
     * 支付反馈
     * @param openid
     * @param feedbackid
     * @return
     */
	public static boolean payfeedback(String openid, String feedbackid) {
		Map<String, String> map = new HashMap<String, String>();
		String accessToken = getAccessToken();
		map.put("access_token", accessToken);
		map.put("openid", openid);
		map.put("feedbackid", feedbackid);
		String jsonStr = HttpKit.get(PAYFEEDBACK_URL, map);
		JSONObject jsonObject = JSONObject.fromObject(jsonStr);
		return "0".equals(jsonObject.get("errcode").toString());
	}

	/**
	 * 签名检查
	 * 
	 * @param signature
	 * @param timestamp
	 * @param nonce
	 * @return
	 */
	public static Boolean checkSignature(String signature, String timestamp,
			String nonce) {
		return Tools.checkSignature(signature, timestamp, nonce);
	}

	/**
	 * 返回对象转为Xml
	 * 
	 * @param outMsg
	 *            返回对象
	 * @return xml
	 */
	public static void beanToXmlStr(OutMessage outMsg, InMessage inMsg,
			HttpServletResponse response) throws IOException {

		outMsg.setToUserName(inMsg.getFromUserName());
		outMsg.setFromUserName(inMsg.getToUserName());
		outMsg.setCreateTime(new Date().getTime());
		outMsg.setFuncFlag(0);

		// 对象转为Xml
		XStream xs = XStreamFactory.init(true);
		xs.alias("xml", outMsg.getClass());
		xs.alias("item", Articles.class);
		String xml = xs.toXML(outMsg);

		LOGGER.debug("输出内容:[" + xml + "]");

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml");
		response.getWriter().write(xml);
	}

	/**
	 * 获取用户信息
	 * 
	 * @param openid
	 * @return
	 */
	public static JSONObject getInfo(String openid) {
		String accessToken = WeChat.getAccessToken();
		String url = WeChatConfig.getProperty("whchat_userInfo_url")
				+ accessToken + "&openid" + openid;
		String jsonStr = HttpKit.get(url);
		return JSONObject.fromObject(jsonStr);
	}

}
