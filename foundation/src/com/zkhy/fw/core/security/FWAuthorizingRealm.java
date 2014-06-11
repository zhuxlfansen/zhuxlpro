package com.zkhy.fw.core.security;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.Sha512Hash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.zkhy.fw.business.FWAccountService;
import com.zkhy.fw.core.util.FWLogger;
import com.zkhy.web.core.util.CommonUtil;
import com.zkhy.web.presentation.common.form.LoginAuthenticationInfo;

/**
 * 用户认证
 *
 * @author guozhiqiang
 *
 */
public class FWAuthorizingRealm extends AuthorizingRealm {
    /**
     * 日志输出
     */
    @Autowired
    protected transient FWLogger logger = null;

    /**
     * 用户认证service
     */
    @Autowired
    protected transient FWAccountService fwAccountService;

    /**
     * 构造方法
     */
    public FWAuthorizingRealm() {
        setName("usernamePasswordRealm");
        HashedCredentialsMatcher hcm = new HashedCredentialsMatcher();
        //使用SHA-512 加密 
        hcm.setHashAlgorithmName(Sha512Hash.ALGORITHM_NAME);
        setCredentialsMatcher(hcm);
    }

    /**
     * 获取用户认证信息
     *
     * @see org.apache.shiro.realm.AuthenticatingRealm#doGetAuthenticationInfo(org.apache.shiro.authc.AuthenticationToken)
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) {
        // Token
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        // 日志
        logger.debug("FWAuthorizingRealm.doGetAuthenticationInfo Start");
        // 没有用户名或没有密码时退出
        if (token == null || StringUtils.isEmpty(token.getUsername()) 
            || token.getPassword().length == 0) {
            logger.errorText("FWAuthorizingRealm.doGetAuthenticationInfo NULL");
            return null;
        }

        try {
            // 调用认证service
            Authenticatable baseInfo = fwAccountService.getAuthenticationInfo(token);
            if (baseInfo == null) {
                return null;
            }
            SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(baseInfo, baseInfo.getPassword(), getName());
            info.setCredentialsSalt(ByteSource.Util.bytes(String.valueOf(token.getPassword()).substring(1, 5)));
            return info;
        } catch (RuntimeException e) {
            logger.error(e);
            throw e;
        } finally {
            logger.debug("FWAuthorizingRealm.doGetAuthenticationInfo End");
        }
    }

    /**
     * 获取用户权限信息
     *
     * @see org.apache.shiro.realm.AuthorizingRealm#doGetAuthorizationInfo(org.apache.shiro.subject.PrincipalCollection)
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        // ログ
        logger.debug("FWAuthorizingRealm.doGetAuthorizationInfo Start");
        // ユーザ
        Authenticatable baseInfo = (Authenticatable) principals.getPrimaryPrincipal();

        if (baseInfo == null) {
            logger.errorText("FWAuthorizingRealm.doGetAuthorizationInfo NULL");
            return null;
        }
        LoginAuthenticationInfo account = CommonUtil.getCurrentUserInfo();
        // ユーザ権限情報を取得する
        //Authorizatable permissions = fwAccountService.getAuthorizationInfo(baseInfo);

        /*if (permissions == null) {
            logger.errorText("FWAuthorizingRealm.doGetAuthorizationInfo NULL2");
            return null;
        }*/

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        if (account != null) {
            info.addRole(account.getUserRole());
        }
        // 権限追加
        //info.addStringPermissions(permissions.getPermissions());
        //info.addRoles(permissions.getPermissions());

        // ログ
        logger.debug("FWAuthorizingRealm.doGetAuthorizationInfo End");
        // 返す
        return info;
    }
}