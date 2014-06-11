package ustc.etyy.wechat.util;


import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

/**
 * @author user
 * 
 */
public final class WeChatConfig {

	private WeChatConfig() {
	}

	/**
	 * 配置文件
	 */
	private static transient List<String> propertyFiles = new ArrayList<String>();

	/**
	 * 设定map
	 */
	private static Map<String, String> configMap = new HashMap<String, String>();

	/**
	 * 读入
	 * 
	 * @throws IOException
	 */
	protected static void setup() throws IOException {

		WeChatConfig.configMap.clear();

		// InputStream
		InputStream in = null;

		Properties config = new Properties();
		// 循环
		for (String file : WeChatConfig.propertyFiles) {
			// 清空
			config.clear();

			try {
				in = WeChatConfig.class.getClassLoader().getResourceAsStream(
						file);
				// 读入
				config.load(in);
				Iterator<Entry<Object, Object>> it = config.entrySet()
						.iterator();
				// 读取下一个
				while (it.hasNext()) {
					// Entry
					Entry<Object, Object> entry = it.next();
					// 存储到map
					WeChatConfig.configMap.put((String) entry.getKey(),
							(String) entry.getValue());
				}
			} finally {
				if (in != null) {
					in.close();
					in = null;
				}
			}
		}
	}

	public static void setPropertyFiles(List<String> propertyFiles) {
		WeChatConfig.propertyFiles = propertyFiles;
	}

	/**
	 * 根据key读入
	 * 
	 * @param key
	 * @return
	 */
	public static String getProperty(String key) {
		return WeChatConfig.configMap.get(key);
	}
}
