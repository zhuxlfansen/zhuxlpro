package com.zkhy.web.presentation.wechat;

import java.io.File;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zkhy.fw.core.util.FWLogger;
import com.zkhy.web.business.common.impl.AccountServiceImpl;
import com.zkhy.web.business.wechat.WeChatService;
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
	
	@Autowired
    private HttpServletRequest req;

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
			outMessage.setContent("发生系统错误，请稍后重试。");
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
	
	@RequestMapping("/mob/processLine")
	public String processLine(String wechatCode,ModelMap model){
	    model.addAttribute("wechatCode", wechatCode);
	    return "/wechat/processLine";
	}
	
	@RequestMapping("/mob/noticeList")
	public String notice(String wechatCode,ModelMap model){
	    model.addAttribute("wechatCode", wechatCode);
	    return "/wechat/noticeList";
	}
	
	@RequestMapping("/mob/photoList")
    public String photo(String wechatCode,ModelMap model){
	    Map<String,Object> map = service.getUserInfoByWechatCode(wechatCode);
	    model.addAttribute("wechatCode", wechatCode);
	    if(map==null){
	        model.addAttribute("notExist", "notExist");
	    }else{
	        String userId=(String)map.get("userId");
	        model.addAttribute("userId", userId);
	        
	        String filePath=req.getSession().getServletContext().getRealPath("/")+"static/upload/"+userId;
	        File file=new File(filePath);
	        if(file.list().length>0){
	            List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
	            Map<String,Object> m = null;
	            Date d=null;
	            String test[] = file.list();
	            SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd");
	            SimpleDateFormat sdf2 = new SimpleDateFormat("HH:mm");
	            for(int i=0;i<test.length;i++){
	                m = new HashMap<String,Object>();
	                d = new Date();
	                d.setTime(Long.parseLong(test[i].substring(0, test[i].length()-4)));
	                
	                m.put("date", sdf1.format(d));
	                m.put("time", sdf2.format(d));
	                m.put("img", test[i]);
	                mapList.add(m);
	                System.out.println(test[i]);
	            }
	            model.addAttribute("mapList", mapList);
	        }
	    }
        return "/wechat/photoList";
    }
	
	@RequestMapping("/mob/photoAlbum")
	public String photoAlbum(String wechatCode,ModelMap model){
	    //Map<String,Object> map = service.getUserInfoByWechatCode(wechatCode);
        model.addAttribute("wechatCode", wechatCode);
        
	    return "/wechat/photoAlbum";
	}
	
	@RequestMapping("/mob/photoDetail")
    public String photoDetail(String wechatCode,ModelMap model){
        //Map<String,Object> map = service.getUserInfoByWechatCode(wechatCode);
        model.addAttribute("wechatCode", wechatCode);
        
        return "/wechat/photoDetail";
    }
	
	@RequestMapping("/mob/toBind")
    public String toBind(String wechatCode,ModelMap model){
	    model.addAttribute("wechatCode", wechatCode);
	    model.addAttribute("count", service.getExistByWechatCode(wechatCode));
        return "/wechat/bind";
    }
	
	@RequestMapping("/mob/getBind")
	@ResponseBody
	public String getBind(String account,String password,String wechatCode){
	    Map<String,Object> map = service.getUserInfoByUserId(account.trim());
	    if(map==null){
	        return "userIdNotExist";
	    }else if(map.get("wechatCode")==null||!map.get("wechatCode").equals("")){
	        return "alreadyBound";
	    }else if(!((String)map.get("password")).trim().equals(AccountServiceImpl.encryptPassword(password))){
	        return "wrongPassword";
	    }
	    service.updateWechatCode(account.trim(),wechatCode.trim());
	    return "success";
	}
}
