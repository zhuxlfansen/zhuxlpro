package mvc.com.main.service.wechat.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import mvc.com.main.common.core.util.FWLogger;
import mvc.com.main.service.member.MemberService;
import mvc.com.main.service.wechat.WeChatService;
import mvc.com.wechat.bean.InMessage;
import mvc.com.wechat.bean.OutMessage;
import mvc.com.wechat.bean.TextOutMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




/**
 * @author user
 * 
 */
@Service
public class WeChatServiceImpl extends DefaultWeChatServiceImpl implements
		WeChatService {

	@Autowired
	private MemberService memberService;
	@Autowired
	private FWLogger logger;
	
	@Override
	public OutMessage textTypeMsg(InMessage msg) {

		TextOutMessage outMessage = new TextOutMessage();


		return outMessage;
	}


	@Override
	public OutMessage eventTypeMsg(InMessage msg) {
		OutMessage outMessage = null;
		System.out.println("========================event:"+msg.getEvent());
		if (msg.getEvent().equals("subscribe")) {// 处理“关注”事件
			outMessage = this.subscribeEvent(msg);
		} else {// 处理默认事件
			outMessage = this.defaultEvent(msg);
		}
		return outMessage;
	}

	public OutMessage subscribeEvent(InMessage msg) {
		// 返回信息
		String wxCode=msg.getFromUserName();
		TextOutMessage outMessage = new TextOutMessage();
		int count = memberService.countByWxCode(wxCode);
		logger.info("count:"+count);
		Map<String,Object> map =new HashMap<String,Object>();
		//count为null代表第一次关注
		
		if(count==0){
			
			map.put("wxCode", wxCode);
			map.put("integral", 0);
			map.put("updateTime", new Date());
			try {
				memberService.createMember(map);
				outMessage.setContent("你好，欢迎关注射击俱乐部！请点击我的会员卡查看自己的积分！");
			} catch (Exception e) {
				logger.equals(e.getStackTrace());
				outMessage.setContent("插入记录失败！");
			}
		}else{
			Map<String,Object> resultMap = memberService.selectIntegralByWxCode(wxCode);
			map.put("integral", ((Integer)resultMap.get("integral"))+1);
			map.put("wxCode", wxCode);
			map.put("updateTime", new Date());
			try {
				memberService.updateIntegral(map);
				outMessage.setContent("已成功为您积分！您当前的积分为："+memberService.selectIntegralByWxCode(wxCode));
			} catch (Exception e) {
				logger.equals(e.getStackTrace());
				outMessage.setContent("积分失败");
			}
			
		}
		
		return outMessage;
	}
	
	/**
	 * 默认事件
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage defaultEvent(InMessage msg) {
		TextOutMessage outMessage = new TextOutMessage();
		outMessage.setContent("123123");
		return outMessage;
	}

	@Override
	public OutMessage locationTypeMsg(InMessage msg) {
		TextOutMessage outMessage = new TextOutMessage();
		Map<String,Object> map =new HashMap<String,Object>();
		String wxCode=msg.getFromUserName();
		Map<String,Object> resultMap = memberService.selectIntegralByWxCode(wxCode);
		map.put("integral", ((Integer)resultMap.get("integral"))+1);
		map.put("wxCode", wxCode);
		map.put("updateTime", new Date());
		try {
			memberService.updateIntegral(map);
			outMessage.setContent("已成功为您积分！您当前的积分为："+memberService.selectIntegralByWxCode(wxCode));
		} catch (Exception e) {
			logger.equals(e.getStackTrace());
			outMessage.setContent("积分失败");
		}
		
		return null;
	}


	@Override
	public OutMessage imageTypeMsg(InMessage msg) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public OutMessage linkTypeMsg(InMessage msg) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public OutMessage voiceTypeMsg(InMessage msg) {
		// TODO Auto-generated method stub
		return null;
	}

}
