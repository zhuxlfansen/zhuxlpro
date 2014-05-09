package ustc.yzwx.business.wechat.impl;

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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import unis.base.util.StringUtil;
import unis.base.util.ValidateUtil;
import ustc.yzwx.business.wechat.WeChatService;
import ustc.yzwx.common.constants.Constants;
import ustc.yzwx.common.constants.MessageCode;
import ustc.yzwx.integration.activity.dao.ActivityDao;
import ustc.yzwx.integration.partakeRecord.dao.PartakeRecordDao;
import ustc.yzwx.integration.student.dao.StudentDao;
import ustc.yzwx.integration.student.dao.SubscribeDao;
import ustc.yzwx.presentation.activity.form.Activity;
import ustc.yzwx.presentation.partakeRecord.form.PartakeRecord;
import ustc.yzwx.presentation.student.form.Student;
import ustc.yzwx.presentation.student.form.Subscribe;
import ustc.yzwx.wechat.bean.Articles;
import ustc.yzwx.wechat.bean.InMessage;
import ustc.yzwx.wechat.bean.NewsOutMessage;
import ustc.yzwx.wechat.bean.OutMessage;
import ustc.yzwx.wechat.bean.TextOutMessage;
import ustc.yzwx.wechat.util.EncryptUtils;
import ustc.yzwx.wechat.util.WeChatSession;

/**
 * @author user
 * 
 */
@Service
public class WeChatServiceImpl extends DefaultWeChatServiceImpl implements
		WeChatService {

	@Autowired
	private StudentDao studentDao;
	@Autowired
	private ActivityDao activityDao;
	@Autowired
	private PartakeRecordDao partakeRecordDao;
	@Autowired
	private SubscribeDao subscribeDao;
	
	@Override
	public OutMessage textTypeMsg(InMessage msg) {

		TextOutMessage outMessage = new TextOutMessage();

		String content = msg.getContent();
		String wxCode = msg.getFromUserName();
		if (ValidateUtil.isNotEmpty(content)) {
			content = content.trim().replace(" ", "").replace("　", ""); // 报名001  标准报名格式
			
			if (("Y".equals(content) || "y".equals(content))
					&& WeChatSession.Contains(wxCode)) {
				int aid = StringUtil.parseInteger(WeChatSession.Get(wxCode));
				Activity act = new Activity();
				act.setId(aid);
				Student stu = studentDao.selectByWxCode(wxCode);
				PartakeRecord partakeRecord = setPartakeRecord(act, stu,
						Constants.ActivityStatusSet.STATUS_APPLY);
				PartakeRecord result = partakeRecordDao
						.selectByStudentAndActivity(partakeRecord);
				if (result == null) {
					partakeRecordDao.insertSelective(partakeRecord);
				}
				outMessage
						.setContent("报名成功！您可在平台菜单【我的活动】中查看已报名活动，选择或修改校方提供的乘车方案。");
				WeChatSession.Remove(wxCode);

				return outMessage;

			} else if (WeChatSession.Contains(wxCode)) {
				outMessage.setContent("您输入的确认信息无效，报名已取消！如需报名，请重新输入【报名】+活动编号");
				WeChatSession.Remove(wxCode);
			}
			
			toApplication(msg, outMessage, content, wxCode);
		} else {
			outMessage.setContent(messageUtil.getMessage(MessageCode.I000005,
					msg.getContent()));
		}

		return outMessage;
	}

	@Override
	public OutMessage imageTypeMsg(InMessage msg) {
	    TextOutMessage outMessage = new TextOutMessage();
	    outMessage.setContent("上传成功！请到活动指定处领取礼品！");
		return outMessage;
	}
	/**
	 * 考生通过发送文本信息如“报名001”来报名活动 001为活动编号
	 * 
	 * @param msg
	 *            考生发送的信息
	 * @param outMessage
	 *            服务号发送给考生的信息
	 * @param content
	 *            考生发送的内容
	 * @param wxCode
	 *            考生的微信号
	 */
	private void toApplication(InMessage msg, TextOutMessage outMessage,
			String content, String wxCode) {
		String regex = "报名[0-9]{3,}";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(content);
		if (matcher.matches()) {
			String id = content.substring(2);
			int aid = StringUtil.parseInteger(id);
			Activity act = activityDao.selectByPrimaryKey(aid);
			if (ValidateUtil.isNotNull(act)) {
				Student stu = studentDao.selectByWxCode(wxCode);
				if (ValidateUtil.isNotNull(stu)) {
					int prCount = partakeRecordDao.findByStuIdAndActId(
							stu.getId(), aid);
					if (prCount > 0) {
						outMessage.setContent("此活动你已报名！");
					} else {
						
						outMessage.setContent("确定报名："+ act.getName()+"\n请立即回复'Y'报名生效,回复其他文字将使报名失效。");
						
						if (!WeChatSession.Contains(wxCode)) {
							WeChatSession.Add(wxCode, id);
						} else {
							WeChatSession.Set(wxCode, id);
						}
					}
				} else {
					toRegister(outMessage,
							Constants.ActivityStatusSet.STATUS_APPLY, wxCode,
							aid);
				}
			} else {
				outMessage.setContent("请输入正确的活动编号！");
			}
		} else {
			if (content.contains("报名")) {
				outMessage.setContent("请输入正确的格式报名：报名+活动编号，如'报名001'");
			} else {
				outMessage.setContent(messageUtil.getMessage(
						MessageCode.I000005, msg.getContent()));
			}

		}
	}

	/**
	 * 用户没有注册 直接跳转到注册页面，并完成报名
	 * 
	 * @param outMessage
	 * @param status
	 *            考生状态 1，报名；2，签到，3，完成
	 * @param wxCode
	 *            考生微信号
	 * @param aid
	 *            活动id
	 */
	private void toRegister(TextOutMessage outMessage, int status,
			String wxCode, int aid) {
		// eventKey格式：qrscene_+状态+活动ID 状态：1报名 2签到
		// 例:qrscene_192（报名92号活动） qrscene_26(签到6号活动)
		String eventKey = Constants.ActivityStatusSet.QRSCENE + status + aid;
		
		eventKey = EncryptUtils.encrypt(eventKey);
		
		outMessage
				.setContent("您还没有填写个人信息！请<a href='http://"+Constants.BASE_URL+"/mob/student/login?wxCode="
						+ wxCode
						+ "&eventKey="
						+ eventKey
						+ "'>点击此处链接</a>完善个人信息并完成报名或签到！");
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
				outMessage = new TextOutMessage("请上传您的分享截图，在指定地点领取礼品。/:gift");
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

		List<Map<String, Object>> mapList = partakeRecordDao
				.queryPartakeRecordsByWxCode(msg.getFromUserName());
		System.out.println("=============size:"+mapList.size());
		if (mapList.size() > 0) {
			NewsOutMessage outMessage = new NewsOutMessage();
			List<Articles> list = new ArrayList<Articles>();
			Articles article = new Articles();
			article.setTitle("点击查看详情/参与互动");
			article.setDescription("");
			article.setPicUrl("http://"+Constants.BASE_URL+"/static/commonImg/logo1.jpg");
			article.setUrl("");
			list.add(article);
			for (Map<String, Object> map : mapList) {
				article = new Articles();
				String status="";
				if(((String)map.get("type")).equals("report")){
					status = ((Integer) map.get("status")).equals(1) ? "已报名"
							: (((Integer) map.get("status")).equals(2) ? "已签到"
									: "已完成");
					article.setTitle("【" + status + "】"
							+ (String) map.get("regionName") + "/"
							+ (String) map.get("activityName"));
				}else{
					status = ((Integer) map.get("auditStatus")).equals(0) ? "未审核"
							: (((Integer) map.get("auditStatus")).equals(1) ? "审核通过"
									: "审核不通过");
					article.setTitle("【" + status + "】"
							+ (String) map.get("activityName"));
				}
				
				article.setDescription("");
				article.setPicUrl("");
				article.setUrl("http://"+Constants.BASE_URL+"/mob/partakeRecord?activityId="
						+ ((Integer) map.get("activityId"))
						+ "&wxCode="
						+ msg.getFromUserName());
				list.add(article);
			}
			outMessage.setArticles(list);
			return outMessage;
		} else {
			TextOutMessage outMessage = new TextOutMessage();
			outMessage.setContent("您暂时没有已参加的活动！");
			return outMessage;
		}

	}

	/**
	 * 默认事件
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage defaultEvent(InMessage msg) {
		TextOutMessage outMessage = new TextOutMessage();
		outMessage.setContent(messageUtil.getMessage(MessageCode.I000001,
				msg.getContent()));
		return outMessage;
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
		System.out.println("==========================================未关注后扫描二维码事件");
		// 获得用户微信code
		String wxCode = msg.getFromUserName();
		String eventKey = msg.getEventKey();
		
		Subscribe subscribe = new Subscribe();
		subscribe.setWxCode(wxCode);
		
		// 将用户信息插入关注用户表
		subscribeDao.insert(subscribe);

		// 如果是普通关注事件
		if (msg.getEventKey() == null || "".equals(eventKey) || Constants.ActivityStatusSet.DEFAULT_SUBSCRIBE.equals(eventKey)) {
			
			outMessage
					.setContent("你好，我是中国科技大学研究生招生小伙伴，感谢您的关注！请<a href='http://"
							+ Constants.BASE_URL + "/mob/student/login?wxCode="
							+ wxCode
							+ "'>点击此处链接</a>完善个人信息，我们一起参与中国科技大学的研究生招生活动！");
		}

		// 如果是扫描带参数二维码事件 eventKey格式：qrscene_+状态+活动ID 状态：1报名 2签到
		// 例:qrscene_192（报名92号活动）
		else {
			eventKey = EncryptUtils.encrypt(eventKey);
			
			outMessage
					.setContent("你好，我是中国科技大学研究生招生小伙伴，感谢您的关注！请<a href='http://"+Constants.BASE_URL+"/mob/student/login?wxCode="
							+ wxCode
							+ "&eventKey="
							+ eventKey
							+ "'>点击此处链接</a>完成报名或签到！");
		}

		return outMessage;
	}

	/**
	 * 取消关注事件
	 * 
	 * @param msg
	 * @return
	 */
	public OutMessage unsubscribeEvent(InMessage msg) {
		
		// 获得用户微信code
		String wxCode = msg.getFromUserName();
		
		// 在关注用户表删除
		subscribeDao.deleteByWxCode(wxCode);

		TextOutMessage outMessage = new TextOutMessage();
		outMessage.setContent(messageUtil.getMessage(MessageCode.I000001,
				msg.getContent()));

		return outMessage;
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

		// 获得用户微信code
		String wxCode = msg.getFromUserName();
		outMessage
				.setContent("请<a href='http://"+Constants.BASE_URL+"/mob/student/login?wxCode="
						+ wxCode + "'>点击此处链接</a>完善信息！");
		
		return outMessage;
	}

	/**
	 * 查看活动
	 * @param msg
	 * @return
	 */
	public OutMessage queryActivity(InMessage msg) {
		Map<String,Object> m =new HashMap<String,Object>();
		m.put("nowTime", new Date());
		m.put("type", "report");
		List<Activity> activityList = activityDao.findAll(m);

		if (activityList.size() > 0) {
			NewsOutMessage outMessage = new NewsOutMessage();
			List<Articles> list = new ArrayList<Articles>();
			Articles article = new Articles();
			article.setTitle("科学家报告会系列活动");
			article.setDescription("");
			article.setPicUrl("http://" + Constants.BASE_URL
					+ "/static/commonImg/logo1.jpg");
			article.setUrl("");
			list.add(article);
			for (Activity activity : activityList) {
				article = new Articles();
				article.setTitle("【"+activity.getName()+"】科学家报告会");
//						+ "\n【回复：'报名"
//						+ StringUtils.leftPad(activity.getId().toString(), 3,
//								'0') + "' 完成报名】");
				article.setDescription("");
				article.setPicUrl("");
				article.setUrl("http://" + Constants.BASE_URL
						+ "/mob/toActivityDetail?id=" + activity.getId());
				list.add(article);
			}
			outMessage.setArticles(list);
			return outMessage;
		} else {
			TextOutMessage outMessage = new TextOutMessage();
			outMessage.setContent("暂时没有举办活动！");
			return outMessage;
		}
	}
	
	/**
	 * 查看活动
	 * @param msg
	 * @return
	 */
	public OutMessage queryCamp(InMessage msg) {
		Map<String,Object> m =new HashMap<String,Object>();
		m.put("nowTime", new Date());
		m.put("type", "camp");
		List<Activity> activityList = activityDao.findAll(m);

		if (activityList.size() > 0) {
			NewsOutMessage outMessage = new NewsOutMessage();
			List<Articles> list = new ArrayList<Articles>();
			Articles article = new Articles();
			article.setTitle("夏令营系列活动");
			article.setDescription("");
			article.setPicUrl("http://" + Constants.BASE_URL
					+ "/static/commonImg/logo1.jpg");
			article.setUrl("");
			list.add(article);
			for (Activity activity : activityList) {
				article = new Articles();
				article.setTitle("【"+activity.getName()+"】夏令营");
//						+ "\n【回复：'报名"
//						+ StringUtils.leftPad(activity.getId().toString(), 3,
//								'0') + "' 完成报名】");
				article.setDescription("");
				article.setPicUrl("");
				article.setUrl("http://" + Constants.BASE_URL
						+ "/mob/toActivityDetail?id=" + activity.getId());
				list.add(article);
			}
			outMessage.setArticles(list);
			return outMessage;
		} else {
			TextOutMessage outMessage = new TextOutMessage();
			outMessage.setContent("暂时没有举办活动！");
			return outMessage;
		}
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
		System.out.println("==========================================已关注后扫描二维码事件");
		// 获得用户微信code
		String wxCode = msg.getFromUserName();
		String eventKey = msg.getEventKey();

		Student student = studentDao.selectByWxCode(wxCode);

		// 如果考生还没有注册
		if (student == null) {
			eventKey = Constants.ActivityStatusSet.QRSCENE + eventKey.trim();
			
			eventKey = EncryptUtils.encrypt(eventKey);
			
			outMessage
					.setContent("您还没有填写个人信息！请<a href='http://"+Constants.BASE_URL+"/mob/student/login?wxCode="
							+ wxCode
							+ "&eventKey="
							+ eventKey
							+ "'>点击此处链接</a>完善个人信息并完成报名或签到！");

			// 如果已经注册了
		} else {
			// 活动ID
			int activityId = Integer.parseInt(eventKey.substring(1));

			// 状态 1报名 2签到
			int status = Integer.parseInt(eventKey.substring(0, 1));
			Activity act = new Activity();
			act.setId(activityId);

			PartakeRecord partakeRecord = setPartakeRecord(act, student, status);
			PartakeRecord result = partakeRecordDao.selectByStudentAndActivity(partakeRecord);

			// 活动报名或签到
			if (result != null) {
				if (result.getStatus() == Constants.ActivityStatusSet.STATUS_APPLY
						&& status == Constants.ActivityStatusSet.STATUS_SIGN) {
					partakeRecordDao.updateByStudentAndActivity(partakeRecord);
				}
			} else {
				partakeRecordDao.insertSelective(partakeRecord);
			}
			
			if (Constants.ActivityStatusSet.STATUS_APPLY == status) {
				outMessage.setContent("报名成功！");
			} else {
				// 活动签到
				outMessage.setContent("签到成功！");
			}
		}
		return outMessage;
	}

	/**
	 * 设置活动报名信息
	 * 
	 * @param act
	 * @param student
	 * @param status
	 * @return
	 */
	private PartakeRecord setPartakeRecord(Activity act, Student student,
			Integer status) {
		PartakeRecord partakeRecord = new PartakeRecord();
		partakeRecord.setActivity(act);
		partakeRecord.setStudent(student);
		partakeRecord.setStatus(status);

		return partakeRecord;
	}
}
