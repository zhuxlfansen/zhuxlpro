package ustc.yzwx.wechat.oauth;

import net.sf.json.JSONObject;
import ustc.yzwx.wechat.util.HttpKit;
import ustc.yzwx.wechat.util.WeChat;
import ustc.yzwx.wechat.util.WeChatConfig;

/**
 * 菜单,可以将accessToken
 * 存储在session或者memcache中
 * @author yujie
 */
public class Menu {

    /**
     * 创建菜单
     */
	public static boolean createMenu(String params) {
		String accessToken = WeChat.getAccessToken();
		String creatUrl = WeChatConfig.getProperty("wechat_creatMenu_url")
				+ accessToken;
		String jsonStr = HttpKit.post(creatUrl, params);
		JSONObject jsonObject = JSONObject.fromObject(jsonStr);
		return "0".equals(jsonObject.get("errcode").toString());

	}
    
    /**
     * 查询菜单
     */
	public static JSONObject getMenuInfo() {
		String accessToken = WeChat.getAccessToken();
		String getUrl = WeChatConfig.getProperty("wechat_getMenu_url")
				+ accessToken;
		String jsonStr = HttpKit.get(getUrl);
		JSONObject jsonObject = JSONObject.fromObject(jsonStr);
		return jsonObject;
	}
    
    /**
     * 删除自定义菜单
     */
	public static boolean deleteMenu() {
		String accessToken = WeChat.getAccessToken();
		String deleteUrl = WeChatConfig.getProperty("wechat_getMenu_url")
				+ accessToken;
		String jsonStr = HttpKit.get(deleteUrl);
		JSONObject jsonObject = JSONObject.fromObject(jsonStr);
		return "0".equals(jsonObject.get("errcode").toString());
	}
}
