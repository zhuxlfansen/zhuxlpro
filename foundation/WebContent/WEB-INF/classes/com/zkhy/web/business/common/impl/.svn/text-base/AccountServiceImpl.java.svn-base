package com.zkhy.web.business.common.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.Sha512Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zkhy.fw.business.FWAccountService;
import com.zkhy.fw.business.impl.BaseServiceImpl;
import com.zkhy.fw.core.security.Authenticatable;
import com.zkhy.web.integration.common.dao.AccountDao;
import com.zkhy.web.integration.common.entity.AccountUserEntity;
import com.zkhy.web.presentation.common.form.LoginAuthenticationInfo;

/**
 *
 * 用户信息service
 *
 * @author guozhiqiang
 *
 */
@Service
@Transactional(readOnly = true)
public class AccountServiceImpl extends BaseServiceImpl implements FWAccountService {

    /**
     * 用户信息DAO
     */
    @Autowired
    private AccountDao accountDao;

    @Override
    public Authenticatable getAuthenticationInfo(UsernamePasswordToken token) {
        String userId = token.getUsername();
        //char[] userPwd = token.getPassword();
        //String userPassword = userPwd == null ? null : String.valueOf(userPwd);
        //密码加密
        //String password = encryptPassword(userPassword);
        Map<String, String> condition = new HashMap<String, String>();
        condition.put(AccountDao.KEY_USER_ID, userId);
        //condition.put(AccountDao.KEY_PASSWORD, password);
        AccountUserEntity entity = accountDao.getUserInfo(condition);
        LoginAuthenticationInfo info = new LoginAuthenticationInfo(token);
        info.setUserID(entity.getUserId());
        info.setUserName(entity.getUserName());
        info.setPassword(entity.getPassword());
        info.setUserRole(entity.getUserRole());
        return info;
    }

    /**
     * パスワードの暗号化
     * @param password パスワード
     * @return 暗号化した後のパスワード
     */
    public static String encryptPassword(String password) {
        return(new Sha512Hash(password, password.substring(1, 5)).toHex());
    }
    
    public static void main(String[] args) {
        System.out.println(encryptPassword("123456"));
    }
}
