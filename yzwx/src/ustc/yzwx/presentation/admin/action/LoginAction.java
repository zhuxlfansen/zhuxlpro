package ustc.yzwx.presentation.admin.action;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ustc.yzwx.common.constants.MessageCode;
import ustc.yzwx.common.core.i18n.I18nMessage;
import ustc.yzwx.common.core.util.FWLogger;
import ustc.yzwx.presentation.common.action.BaseAction;

/**
 * @author user
 * 
 */
@Controller
public class LoginAction extends BaseAction {

	@Autowired
	private FWLogger logger;

	/**
	 * 用户登录
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String username, String password, ModelMap model) {

		UsernamePasswordToken token = new UsernamePasswordToken(username,
				password);

		// 获取当前的Subject
		Subject currentUser = SecurityUtils.getSubject();
		try {
			currentUser.login(token);
		} catch (AuthenticationException e) {

			addMessage(model, new I18nMessage(messageAccessor,
					MessageCode.E000001));
			token.clear();
			return "login";
		}

		return "redirect:/toStudentList";
	}

	/**
	 * 用户退出
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(ModelMap model) {
		SecurityUtils.getSubject().logout();
		addMessage(model, new I18nMessage(messageAccessor, MessageCode.I000009));
		// return InternalResourceViewResolver.REDIRECT_URL_PREFIX + "/";
		return "login";
	}
}
