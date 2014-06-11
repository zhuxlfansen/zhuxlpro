package com.zkhy.wechat.util;

import java.util.HashMap;

/**
 * @author user
 * 
 */
public class WeChatSession {

	// 缓存hashmap
	private static HashMap<String, String> mDic = new HashMap<String, String>();

	// 添加
	public static void Add(String key, String value) {
		mDic.put(key, value);
	}

	// 移除
	public static void Remove(String key) {
		if (mDic.containsKey(key)) {
			mDic.remove(key);
		}
	}

	// 设置
	public static void Set(String key, String value) {
		mDic.put(key, value);
	}

	// 获取值
	public static String Get(String key) {
		return mDic.get(key);
	}

	// 含有
	public static boolean Contains(String key) {
		return mDic.containsKey(key);
	}

	// 清空所有项
	public static void Clear() {
		mDic.clear();
	}
}
