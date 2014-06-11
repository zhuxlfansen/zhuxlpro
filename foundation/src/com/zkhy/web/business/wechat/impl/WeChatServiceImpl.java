package com.zkhy.web.business.wechat.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zkhy.fw.core.util.FWLogger;
import com.zkhy.web.business.wechat.WeChatService;
import com.zkhy.web.integration.wechat.WechatDao;
import com.zkhy.web.presentation.wechat.form.DynamicForm;
import com.zkhy.wechat.bean.Articles;
import com.zkhy.wechat.bean.InMessage;
import com.zkhy.wechat.bean.NewsOutMessage;
import com.zkhy.wechat.bean.OutMessage;
import com.zkhy.wechat.bean.TextOutMessage;
import com.zkhy.wechat.util.AdvancedUtil;
import com.zkhy.wechat.util.WeChatConfig;




/**
 * @author user
 * 
 */
@Service
public class WeChatServiceImpl extends DefaultWeChatServiceImpl implements
		WeChatService {

	@Autowired
	private FWLogger logger;
	@Autowired
	private WechatDao wechatDao;
	@Autowired
	private HttpServletRequest req;
	
	@Override
	public OutMessage textTypeMsg(InMessage msg) {

	    OutMessage outMessage = null;
	    String content = msg.getContent().trim();
	    if(content.length()>2&&content.substring(0, 2).toLowerCase().equals("sq")){
	        outMessage = this.pushSQInfo(msg);
	    }else if(content.equals("通知")){
		    outMessage = this.getNoticeMsg(msg);
		}else if(content.equals("日程")){
		    outMessage = this.getProcessMsg(msg);
		}else{
		    outMessage = this.defaultEvent(msg);
		}

		return outMessage;
	}
	
	private OutMessage pushSQInfo(InMessage msg){
	    TextOutMessage outMessage = new TextOutMessage();
	    Map<String,Object> map = wechatDao.getUserInfoByWechatCode(msg.getFromUserName());
	    if(map==null){
	        outMessage.setContent("您还没有绑定学生账号，<a href='http://"+WeChatConfig.getProperty("site_url")+"/mob/toBind?wechatCode="+msg.getFromUserName()+"'>请点击此处进行绑定！</a>");
	    }else{
	        DynamicForm df = new DynamicForm();
	        df.setContent(msg.getContent().substring(2, msg.getContent().length()));
	        df.setCreator((String)map.get("userId"));
	        df.setCreateTime(new Date());
	        try {
	            wechatDao.pushSQInfo(df);
	            outMessage.setContent("已收到您发送的内容！");
            } catch (Exception e) {
                logger.error(e);
                outMessage.setContent("发送失败，请重新发送！");
            }
	    }
	    
	    return outMessage;
	}
	
	private OutMessage getNoticeMsg(InMessage msg){
	    NewsOutMessage outMessage = new NewsOutMessage();
        List<Articles> list = new ArrayList<Articles>();
        Articles article = new Articles();
        article.setTitle("最新通知");
        article.setDescription("");
        article.setPicUrl("http://"+WeChatConfig.getProperty("site_url")+"/static/images/top.jpg");
        article.setUrl("");
        list.add(article);
        
        article = new Articles();
        article.setTitle("关于清华大学2014年交流会的通知\n2014/04/01");
        article.setDescription("");
        article.setPicUrl("");
        article.setUrl("http://"+WeChatConfig.getProperty("site_url")+"/mob/noticeList?wechatCode="+msg.getFromUserName());
        list.add(article);

        article = new Articles();
        article.setTitle("关于北京大学2014年交流会的通知\n2014/04/01");
        article.setDescription("");
        article.setPicUrl("");
        article.setUrl("http://"+WeChatConfig.getProperty("site_url")+"/mob/noticeList?wechatCode="+msg.getFromUserName());
        list.add(article);
        
        article = new Articles();
        article.setTitle("关于深圳大学2014年交流会的通知\n2014/04/01");
        article.setDescription("");
        article.setPicUrl("");
        article.setUrl("http://"+WeChatConfig.getProperty("site_url")+"/mob/noticeList?wechatCode="+msg.getFromUserName());
        list.add(article);
        
        outMessage.setArticles(list);
        return outMessage;
	}
	
	private OutMessage getProcessMsg(InMessage msg){
	    TextOutMessage outMessage = new TextOutMessage();
        outMessage.setContent("<a href='http://"+WeChatConfig.getProperty("site_url")+"/mob/processLine?wechatCode="+msg.getFromUserName()+"'>请点击此处查看活动日程</a>");
        return outMessage;
    }


	@Override
	public OutMessage eventTypeMsg(InMessage msg) {
		OutMessage outMessage = null;
		if (msg.getEvent().equals("subscribe")) {// 处理“关注”事件
			outMessage = this.subscribeEvent(msg);
		} else if(msg.getEvent().equals("CLICK")){
		    if(msg.getEventKey().equals("noticeList")){
		        outMessage = this.getNoticeMsg(msg);
		    }else if(msg.getEventKey().equals("processLine")){
		        outMessage = this.getProcessMsg(msg);
		    }else if(msg.getEventKey().equals("bind")){
		        outMessage = this.bind(msg);
		    }else{
		        outMessage = this.defaultEvent(msg);
		    }
		} else{// 处理默认事件
			outMessage = this.defaultEvent(msg);
		}
		return outMessage;
	}
	
	public OutMessage bind(InMessage msg){
	    TextOutMessage outMessage = new TextOutMessage();
	    
	    if(wechatDao.getExistByWechatCode(msg.getFromUserName())>0){
            outMessage.setContent("您已经完成绑定，请勿重复操作！");
        }else{
            outMessage.setContent("<a href='http://"+WeChatConfig.getProperty("site_url")+"/mob/toBind?wechatCode="+msg.getFromUserName()+"'>请点击此处进行绑定！</a>");
        }
	    return outMessage;
	}

	public OutMessage subscribeEvent(InMessage msg) {
		// 返回信息
		TextOutMessage outMessage = new TextOutMessage();
		String s="欢迎关注唐仲英德育奖学金交流会官方微信！第八届交流会由中国科学技术大学承办，定于2014年X月X日举行。" +
				"我们将面向交流会参会同学举办“公益项目策划方案大赛”和“手机摄影大赛”两项互动活动，参与活动<a href='http://"+WeChatConfig.getProperty("site_url")+"/mob/toBind?wechatCode="+msg.getFromUserName()+"'>请先点击此链接绑定您的微信号！</a>。" +
				"本微信公众号将全程为您提供服务，如需更多详情，欢迎访问http://www.deyuscholar.com。\n回复：SQ+内容，发送上墙信息（如：SQ我要评论）。";
		/*if(wechatDao.getExistByWechatCode(msg.getFromUserName())>0){
		    outMessage.setContent(s);
		}else{
		    outMessage.setContent(s+"\n您还没有绑定学生账号，<a href='http://"+WeChatConfig.getProperty("site_url")+"/mob/toBind?wechatCode="+msg.getFromUserName()+"'>请点击此处进行绑定！</a>");
		}*/
		outMessage.setContent(s);
		return outMessage;
	}
	
	/**
	 * 默认事件
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage defaultEvent(InMessage msg) {
	 // 返回信息
        TextOutMessage outMessage = new TextOutMessage();
        //String s="无效的回复！\n1.回复“通知”查看最新通知;\n2.回复“日程”查看活动日程;\n3.回复图片上传您的作品。";
        String s="请点击菜单获取更多服务，回复：SQ+内容，发送上墙信息（如：SQ我要评论）。";
        if(wechatDao.getExistByWechatCode(msg.getFromUserName())>0){
            outMessage.setContent(s);
        }else{
            outMessage.setContent(s+"\n您还没有绑定学生账号，<a href='http://"+WeChatConfig.getProperty("site_url")+"/mob/toBind?wechatCode="+msg.getFromUserName()+"'>请点击此处进行绑定！</a>");
        }
		return outMessage;
	}

	@Override
	public OutMessage locationTypeMsg(InMessage msg) {
		return null;
	}


	@Override
	public OutMessage imageTypeMsg(InMessage msg) {
		// TODO Auto-generated method stub
	    System.out.println("=======msgPath:"+msg.getPicUrl());
	    TextOutMessage outMessage = new TextOutMessage();
	    
	    Map<String,Object> map = wechatDao.getUserInfoByWechatCode(msg.getFromUserName());
	    if(map==null){
	        outMessage.setContent("您还没有绑定学生账号，<a href='http://"+WeChatConfig.getProperty("site_url")+"/mob/toBind?wechatCode="+msg.getFromUserName()+"'>请点击此处进行绑定！</a>");
	    }else{
	        try {
	            //new一个URL对象
	            URL url = new URL(msg.getPicUrl());
	            //打开链接  
	            HttpURLConnection conn = (HttpURLConnection)url.openConnection();  
	            //设置请求方式为"GET"  
	            //conn.setRequestMethod("GET");  
	            //超时响应时间为5秒  
	            conn.setConnectTimeout(5 * 1000);  
	            //通过输入流获取图片数据  
	            InputStream inStream = conn.getInputStream();  
	            //得到图片的二进制数据，以二进制封装得到数据，具有通用性  
	            byte[] data = AdvancedUtil.readInputStream(inStream);  
	            //new一个文件对象用来保存图片，默认保存当前工程根目录  
	            
	            String filePath=req.getSession().getServletContext().getRealPath("/")+"static/upload/"+((String)map.get("userId"));
	            String imgName = (new Date()).getTime()+".jpg";
	            String path=filePath+"/"+imgName;
	            AdvancedUtil.isExist(filePath);
	            System.out.println("============filePath:"+filePath);
	            System.out.println("============path:"+path);
	            File f = new File(filePath);  
	            File imageFile = new File(path);  
	            if(f.list().length>=5){
	                outMessage.setContent("每人最多只能上传5张作品！<a href='http://"+WeChatConfig.getProperty("site_url")+"/mob/photoList?wechatCode="+msg.getFromUserName()+"'>请点击此处查看您的作品！</a>");
	            }else{
	                //创建输出流  
	                FileOutputStream outStream = new FileOutputStream(imageFile);  
	                //写入数据  
	                outStream.write(data);  
	                //关闭输出流  
	                outStream.close();
	                outMessage.setContent("上传成功！<a href='http://"+WeChatConfig.getProperty("site_url")+"/mob/photoList?wechatCode="+msg.getFromUserName()+"'>请点击此处查看您的作品！</a>");
	                DynamicForm df = new DynamicForm();
	                df.setPicPath(imgName);
	                df.setCreator((String)map.get("userId"));
	                df.setCreateTime(new Date());
	                wechatDao.pushSQInfo(df);
	            }
	        } catch (Exception e) {
	            logger.error(e);
	            outMessage.setContent("上传失败！");
	        }   
	    }
		return outMessage;
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


	/*******************************************************************************************************
	 * 非微信接口方法
	 ******************************************************************************************************* 
	 */
	 @Override
    public int getExistByWechatCode(String wechatCode) {
        return wechatDao.getExistByWechatCode(wechatCode);
    }
	
    @Override
    public Map<String, Object> getUserInfoByUserId(String userId) {
        return wechatDao.getUserInfoByUserId(userId);
    }


    @Override
    public int updateWechatCode(String userId,String wechatCode) {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("userId", userId);
        map.put("wechatCode", wechatCode);
        return wechatDao.updateWechatCode(map);
    }

    @Override
    public Map<String, Object> getUserInfoByWechatCode(String wechatCode) {
        return wechatDao.getUserInfoByWechatCode(wechatCode);
    }
    
}
