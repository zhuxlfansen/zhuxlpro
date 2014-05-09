package ustc.yzwx.presentation.partakeRecord.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import unis.base.util.StringUtil;
import unis.base.util.ValidateUtil;
import ustc.yzwx.business.activity.ActivityService;
import ustc.yzwx.business.partakeRecord.PartakeRecordService;
import ustc.yzwx.business.student.MajorService;
import ustc.yzwx.business.student.StudentService;
import ustc.yzwx.common.constants.Constants;
import ustc.yzwx.common.constants.MessageCode;
import ustc.yzwx.common.core.i18n.I18nMessage;
import ustc.yzwx.presentation.activity.form.Activity;
import ustc.yzwx.presentation.common.action.BaseAction;
import ustc.yzwx.presentation.partakeRecord.form.PartakeRecord;
import ustc.yzwx.presentation.student.form.Major;
import ustc.yzwx.presentation.student.form.Student;
import ustc.yzwx.wechat.bean.WeixinOauth2Token;
import ustc.yzwx.wechat.util.AdvancedUtil;
import ustc.yzwx.wechat.util.EncryptUtils;

@Controller
@RequestMapping("/mob")
public class partakeRecordAction extends BaseAction {

	@Autowired
	private PartakeRecordService partakeRecordService;
	@Autowired
	private ActivityService activityService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private MajorService majorService;

	@RequestMapping("/partakeRecord")
	public String partakeRecordInfo(String wxCode, int activityId, Model model) {
		Map<String, Object> map = partakeRecordService.queryPartakeRecordByKey(
				wxCode, activityId);
		if (map != null) {
			Date now = new Date();
			if((((Date)map.get("startTime")).getTime()-now.getTime())>=(3600*24*1000)){
				model.addAttribute("dateLimit", true);
			}else{
				model.addAttribute("dateLimit", false);
			}
			model.addAttribute("partakeRecord", map);
			model.addAttribute("boardingList",
					activityService.getBoardingsByActivityId(activityId));
			model.addAttribute(
					"studentId",
					EncryptUtils.encrypt(partakeRecordService
							.selectStudentByWxCode(wxCode) + ""));
			model.addAttribute("activityId", activityId);
			return "partakeRecordDetail";
		} else
			return "/error/wechat500";
	}
	
	@RequestMapping("/changeBoarding")
	@ResponseBody
	public String changeBoarding(Integer boardingId, int activityId,
			String studentId) {
		if (boardingId != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("activityId", activityId);
			map.put("studentId",
					Integer.parseInt(EncryptUtils.decrypt(studentId)));
			map.put("boardingId", boardingId);
			partakeRecordService.updateSelective(map);
		}
		return "success";
	}

	@RequestMapping("/insertComment")
	@ResponseBody
	public String insertComment(int activityId, String studentId,
			Float satisZZ, Float satisNR, Float satisJD, String suggestion) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("studentId",
					Integer.parseInt(EncryptUtils.decrypt(studentId)));
			map.put("activityId", activityId);
			map.put("satisZZ", satisZZ);
			map.put("satisNR", satisNR);
			map.put("satisJD", satisJD);
			map.put("suggestion", suggestion);
			map.put("status", 3);
			if (partakeRecordService.updateSelective(map) > 0) {
				return "success";
			} else
				return "error";
		} catch (Exception e) {
			return "error";
		}

	}

	@RequestMapping("/toActivityDetail")
	private String toActivityDetail(ModelMap model, String id/*, String wxCode*/) {
		Activity activity = activityService.findById(StringUtil
				.parseInteger(id));
		if(activity.getType().equals("camp")){
			Major major = majorService.selectByMajorCode(activity.getMajorCode());
			model.addAttribute("majorName", major.getName());
		}
		if (activity != null) {
			/*int signUpStatus = 0;*/
			model.addAttribute("activity", activity);
			/*Student student = studentService.selectByWxCode(wxCode);
			if (student != null) {
				int num = partakeRecordService.findByStuIdAndActId(
						student.getId(), Integer.parseInt(id));
				if (num > 0) {
					signUpStatus = 1;
				}
			}
			model.addAttribute("signUpStatus", signUpStatus);
			model.addAttribute("wxCode", wxCode);*/
			return "activityDetail";
		} else {
			addMessage(model, new I18nMessage(messageAccessor,
					MessageCode.E000082));
			return "info";
		}
	}

	@RequestMapping("/signup")
	private String signUp(int activityId,String type,ModelMap model) {
		
		Activity act = activityService.findById(activityId);
		
		model.addAttribute("attid" ,activityId);
		
		String openId="";
		
		if (ValidateUtil.isNotNull(act)) {
			
			// 获取用户openid
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
					.getRequestAttributes()).getRequest();
			String code = request.getParameter("code");
			
			// 用户同意授权
			if (!"authdeny".equals(code) && code != null) {
				// 获取网页授权access_token
				WeixinOauth2Token weixinOauth2Token = AdvancedUtil
						.getOauth2AccessToken(Constants.APPID,
								Constants.APPSECRET, code);
				openId = weixinOauth2Token.getOpenId();
			}
			
			Student stu = studentService.selectByWxCode(openId);
			
			if (ValidateUtil.isNotNull(stu)) {
				int prCount = partakeRecordService.findByStuIdAndActId(
						stu.getId(), activityId);
				if (prCount > 0) {
					/* outMessage.setContent("此活动你已报名！"); */
					addMessage(model, new I18nMessage(messageAccessor,
							MessageCode.I000014) );
				} else {
					PartakeRecord partakeRecord = setPartakeRecord(act, stu,
							Constants.ActivityStatusSet.STATUS_APPLY);
					partakeRecordService.insertSelective(partakeRecord);
					/* outMessage.setContent("报名成功！"); */
					if(type.trim().equals("report")){
						addMessage(model, new I18nMessage(messageAccessor,
								MessageCode.I000011));
					}else{
						addMessage(model, new I18nMessage(messageAccessor,
								MessageCode.I000015));
					}
					
				}
			} else {
				/*
				 * addMessage(model, new I18nMessage(messageAccessor,
				 * MessageCode.E000081));
				 */

				// eventKey格式：qrscene_+状态+活动ID 状态：1报名 2签到
				// 例:qrscene_192（报名92号活动） qrscene_26(签到6号活动)
				String eventKey = Constants.ActivityStatusSet.QRSCENE
						+ Constants.ActivityStatusSet.STATUS_APPLY + activityId;

				eventKey = EncryptUtils.encrypt(eventKey);

				String url = "redirect:/mob/student/login?wxCode=" + openId
						+ "&eventKey=" + eventKey;

				return url;
			}
		} else {
			addMessage(model, new I18nMessage(messageAccessor,
					MessageCode.E000082));
		}
		return "activityInfo";
	}

	private PartakeRecord setPartakeRecord(Activity act, Student student,
			Integer status) {
		PartakeRecord partakeRecord = new PartakeRecord();
		partakeRecord.setActivity(act);
		partakeRecord.setStudent(student);
		partakeRecord.setStatus(status);

		return partakeRecord;
	}

}
