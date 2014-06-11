package ustc.etyy.wechat.util;


/**
 * @author yujie
 *
 */
public class WechatAccessToken {

	private static String accessToken = "";
	
	/**
	 * 获取accessToken
	 */
	public static void init() {
		accessToken = WeChat.getAccessToken();
	}
	
	public static String getAccessToken() {
		return accessToken;
	}
}
