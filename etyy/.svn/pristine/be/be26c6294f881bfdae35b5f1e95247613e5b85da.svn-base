package ustc.etyy.business.wechat.impl;

import org.springframework.stereotype.Service;

import ustc.etyy.business.wechat.WeChatService;
import ustc.etyy.common.constants.Constants;
import ustc.etyy.wechat.bean.InMessage;
import ustc.etyy.wechat.bean.OutMessage;
import ustc.etyy.wechat.bean.TextOutMessage;



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


		return outMessage;
	}
	
	@Override
	public OutMessage voiceTypeMsg(InMessage msg) {
		
		TextOutMessage outMessage = new TextOutMessage();
		
		String content = msg.getRecognition();
		String wxCode = msg.getFromUserName();
		return outMessage;
	}

	@Override
	public OutMessage imageTypeMsg(InMessage msg) {
	    TextOutMessage outMessage = new TextOutMessage();
	    outMessage.setContent("上传成功！感谢您对中国科大研招工作的支持，请到活动指定处领取小礼品！");
		return outMessage;
	}


	@Override
	public OutMessage eventTypeMsg(InMessage msg) {
		OutMessage outMessage = null;

		// 判断事件类型
		if (msg.getEvent().equals("CLICK")) {// 处理CLICK事件
			if (msg.getEventKey().equals("partakeRecord")) {
				outMessage = this.partakeRecordClick(msg);
			} else if (msg.getEventKey().equals("completeStudentData")) {
				outMessage = this.completeStudentData(msg);
			} else if (msg.getEventKey().equals("queryActivity")) {
				outMessage = this.queryActivity(msg);
			} else if (msg.getEventKey().equals("summerCamp")) {
				outMessage = this.queryCamp(msg);
			} else if (msg.getEventKey().equals("hudong")) {
				outMessage = new TextOutMessage("小伙伴们，赶快将中国科大研究生招生平台或夏令营活动分享给朋友或者朋友圈，再上传您的分享截图，就可以到在指定地点领取精美小礼品哦，/:gift，快快行动起来，多多支持我们吧。");
			} else if (msg.getEventKey().equals("queryList")) {
				outMessage = new TextOutMessage("请<a href='http://"+Constants.BASE_URL+"/mob/studentQuery?wxCode="
					+ msg.getFromUserName() + "'>点击此处链接</a>查看咨询记录。");
			} else {
				outMessage = this.defaultEvent(msg);
			}

		} else if (msg.getEvent().equals("subscribe")) {// 处理“关注”事件

			outMessage = this.subscribeEvent(msg);

		} else if (msg.getEvent().equals("unsubscribe")) {// 处理“取消关注”事件

			outMessage = this.defaultEvent(msg);

		} else if (msg.getEvent().equals("SCAN")) {// 已关注，扫描二维码

			outMessage = this.scanEvent(msg);

		} else if (msg.getEvent().equals("LOCATION")) {// 上传地理信息

			outMessage = this.defaultEvent(msg);

		} else {// 处理默认事件

			outMessage = this.defaultEvent(msg);

		}
		return outMessage;
	}

	/**
	 * 查询参加的活动列表并回复给用户
	 * 
	 * @param msg
	 *            接收用户信息
	 * @return 返回news信息
	 */
	public OutMessage partakeRecordClick(InMessage msg) {

		return null;
	}

	/**
	 * 默认事件
	 * 
	 * @param msg
	 * @return
	 */
	private TextOutMessage defaultEvent(InMessage msg) {
		TextOutMessage outMessage = new TextOutMessage();
		return outMessage;
	}
	
	private void defaultMsg(InMessage msg, TextOutMessage outMsg) {
	}

	/**
	 * 关注事件 + 未关注时的二维码扫描事件
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage subscribeEvent(InMessage msg) {
		// 返回信息
		TextOutMessage outMessage = new TextOutMessage();

		return outMessage;
	}

	/**
	 * 取消关注事件
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage unsubscribeEvent(InMessage msg) {
		
		return null;
	}

	/**
	 * 完善用户信息
	 * 
	 * @param msg
	 * @return OutMessage
	 */
	public OutMessage completeStudentData(InMessage msg) {
		// 返回信息
		TextOutMessage outMessage = new TextOutMessage();

		return outMessage;
	}

	/**
	 * 查看活动
	 * @param msg
	 * @return
	 */
	public OutMessage queryActivity(InMessage msg) {
		return null;
	}
	
	/**
	 * 查看活动
	 * @param msg
	 * @return
	 */
	public OutMessage queryCamp(InMessage msg) {
		return null;
	}

	/**
	 * 已关注后的二维码扫描事件(报名，签到)
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage scanEvent(InMessage msg) {
		// 返回信息
		TextOutMessage outMessage = new TextOutMessage();
		return outMessage;
	}

}
