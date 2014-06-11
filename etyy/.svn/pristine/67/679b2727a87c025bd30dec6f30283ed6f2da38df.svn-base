package ustc.etyy.wechat.util;


import java.util.HashMap;

import ustc.etyy.wechat.bean.WechatQueryBean;


/**
 * @author user
 * 
 */
public class WeChatSession {

	// 缓存hashmap
	private static HashMap<String, Integer> mDic = new HashMap<String, Integer>();
	
	private static HashMap<String,WechatQueryBean> queryDic = new HashMap<String, WechatQueryBean>();

	// 添加
	public static void Add(String key, Integer value) {
		mDic.put(key, value);
	}
	
	// 添加
	public static void AddQuery(String key, WechatQueryBean bean) {
		queryDic.put(key, bean);
	}

	// 移除
	public static void Remove(String key) {
		if (mDic.containsKey(key)) {
			mDic.remove(key);
		}
	}
	
	// 移除
	public static void RemoveQuery(String key) {
		if (queryDic.containsKey(key)) {
			queryDic.remove(key);
		}
	}

	// 设置
	public static void Set(String key, Integer value) {
		mDic.put(key, value);
	}
	
	// 设置
	public static void SetQuery(String key,WechatQueryBean bean) {
		queryDic.put(key, bean);
	}

	// 获取值
	public static Integer Get(String key) {
		return mDic.get(key);
	}
	
	// 获取值
	public static WechatQueryBean GetQuery(String key) {
		return queryDic.get(key);
	}

	// 含有
	public static boolean Contains(String key) {
		return mDic.containsKey(key);
	}
	
	// 含有
	public static boolean ContainsQuery(String key) {
		return queryDic.containsKey(key);
	}

	// 清空所有项
	public static void Clear() {
		mDic.clear();
		queryDic.clear();
	}
}
