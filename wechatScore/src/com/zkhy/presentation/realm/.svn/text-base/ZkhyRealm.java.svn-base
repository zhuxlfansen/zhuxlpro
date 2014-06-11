package com.zkhy.presentation.realm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.zkhy.business.manager.ManagerService;
import com.zkhy.common.core.util.FWLogger;
import com.zkhy.presentation.manager.form.Manager;

/**
 * 自定义的指定Shiro验证用户登录的类
 */
public class ZkhyRealm extends AuthorizingRealm {

	@Autowired
	private transient ManagerService service;

	@Autowired
	private transient FWLogger logger;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		// 获取当前登录的用户名
		String currentUsername = (String) super
				.getAvailablePrincipal(principals);

		if (null != currentUsername) {
			// 到数据库查是否有此对象
			Manager manager = service.checkUserName(currentUsername);

			if (manager != null) {
				SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
				simpleAuthorInfo.addRole("admin");
				return simpleAuthorInfo;
			}
		}

		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {

		// UsernamePasswordToken对象用来存放提交的登录信息
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;

		// 查出是否有此用户
		Manager manager = service.checkUserName(token.getUsername());

		if (manager != null) {

			// 若存在，将此用户存放到登录认证info中
			this.setSession("currentUser", manager.getUsername());

			return new SimpleAuthenticationInfo(manager.getUsername(), manager
					.getPassword().toCharArray(), getName());
		}

		return null;
	}

	/**
	 * 将一些数据放到ShiroSession中,以便于其它地方使用
	 * 
	 * @see 比如Controller,使用时直接用HttpSession.getAttribute(key)就可以取到
	 */
	private void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			if (null != session) {
				logger.info("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
				session.setAttribute(key, value);
			}
		}
	}
}
