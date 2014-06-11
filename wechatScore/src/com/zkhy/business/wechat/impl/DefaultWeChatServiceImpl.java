package com.zkhy.business.wechat.impl;


import org.springframework.beans.factory.annotation.Autowired;

import com.zkhy.common.constants.MessageCode;
import com.zkhy.common.core.util.MessageUtil;
import com.zkhy.wechat.bean.InMessage;
import com.zkhy.wechat.bean.OutMessage;
import com.zkhy.wechat.bean.TextOutMessage;


/**
 * @author user
 * 
 */
public abstract class DefaultWeChatServiceImpl {

	@Autowired
	protected MessageUtil messageUtil;

	/**
	 * 文本类型
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage textTypeMsg(InMessage msg) {
		return allType(msg);
	}

	/**
	 * 地理位置类型
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage locationTypeMsg(InMessage msg) {
		return allType(msg);
	}

	/**
	 * 图像类型
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage imageTypeMsg(InMessage msg) {
		return allType(msg);
	}

	/**
	 * 链接类型
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage linkTypeMsg(InMessage msg) {
		return allType(msg);
	}

	/**
	 * 声音类型
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage voiceTypeMsg(InMessage msg) {
		return allType(msg);
	}

	/**
	 * 事件类型
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage eventTypeMsg(InMessage msg) {
		return allType(msg);
	}

	/**
	 * 恢复内容取得
	 * 
	 * @param msg
	 * @return
	 */
	private OutMessage allType(InMessage msg) {
		TextOutMessage out = new TextOutMessage();
		out.setContent(messageUtil.getMessage(MessageCode.I000004));
		return out;
	}
}
