package com.zkhy.presentation.wechat;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zkhy.business.wechat.WeChatService;
import com.zkhy.common.constants.MessageCode;
import com.zkhy.common.core.util.FWLogger;
import com.zkhy.wechat.bean.InMessage;
import com.zkhy.wechat.bean.OutMessage;
import com.zkhy.wechat.bean.TextOutMessage;
import com.zkhy.wechat.util.WeChat;


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
	
	@RequestMapping("/mob/toBind")
    public String toBind(String wechatCode,ModelMap model){
	    model.addAttribute("wechatCode", wechatCode);
	    model.addAttribute("count", service.checkExistByWechatCode(wechatCode));
        return "/wechat/bind";
    }
	
	@RequestMapping("/mob/getBind")
	@ResponseBody
	public String getBind(Integer account,String password,String wechatCode){
	    Map<String,Object> map = service.getUserInfoByUserId(account);
	    SimpleHash hash = new SimpleHash("MD5", password.trim());
		String psd =hash.toHex();
	    if(map==null){
	        return "userIdNotExist";
	    }else if(map.get("wechatCode")!=null&&!map.get("wechatCode").equals("")){
	    	return "alreadyBound";
	    }else if(!((String)map.get("password")).trim().equals(psd)){
	        return "wrongPassword";
	    }
	    service.doBind(wechatCode.trim(), account);
	    return "success";
	}
	
	@RequestMapping("/mob/examDetail")
    public String examDetail(String wechatCode,int examId,ModelMap model){
		model.addAttribute("wechatCode", wechatCode);
		List<Map<String,Object>> mapList = this.service.getExamDetail(wechatCode, examId);
		if(mapList.size()>0){
			Map<String,Object> map = new HashMap<String,Object>();
			map=mapList.get(0);
			model.addAttribute("obj", map);
		    model.addAttribute("mapList", mapList);
		    model.addAttribute("status", "full");
		}else{
			model.addAttribute("status", "empty");
		}
	    
        return "/wechat/examDetail";
    }
	
	@RequestMapping("/mob/examFullList")
    public String examFullList(String wechatCode,ModelMap model){
		model.addAttribute("wechatCode", wechatCode);
		List<Map<String,Object>> mapList = this.service.getExamFullList();
		if(mapList.size()>0){
			
		    model.addAttribute("mapList", mapList);
		    model.addAttribute("status", "full");
		}else{
			model.addAttribute("status", "empty");
		}
	    
        return "/wechat/examFullList";
    }
	
	@RequestMapping("/mob/scoreDetail")
    public String scoreDetail(String wechatCode,int scoreId,ModelMap model){
		model.addAttribute("wechatCode", wechatCode);
		List<Map<String,Object>> mapList = this.service.getScoreDetail(scoreId);
		if(mapList.size()>0){
			Map<String,Object> map = new HashMap<String,Object>();
			map=mapList.get(0);
			model.addAttribute("obj", map);
		    model.addAttribute("mapList", mapList);
		    model.addAttribute("status", "full");
		}else{
			model.addAttribute("status", "empty");
		}
        return "/wechat/scoreDetail";
    }
/*	@RequestMapping(value = "/qrcode")
	public String qrcodeTest(HttpServletRequest request, HttpServletResponse response){
		System.out.println("user-agent:"+request.getHeader("user-agent"));
		System.out.println("userPrincipal:"+request.get);
		return "123";
	}*/
}
