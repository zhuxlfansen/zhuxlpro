package com.zkhy.fw.business;

import org.apache.shiro.authc.UsernamePasswordToken;

import com.zkhy.fw.core.security.Authenticatable;

/**
 * アカウント用サービス
 *
 * @author SJI
 */
public interface FWAccountService extends BaseService {
    /**
     * ユーザ認証情報を取得する。
     *
     * @param token UsernamePasswordToken
     * @return ユーザ認証情報
     */
    Authenticatable getAuthenticationInfo(final UsernamePasswordToken token);

    /**
     * ユーザ権限情報を取得する。
     *
     * @param baseInfo Authenticatable
     * @return ユーザ権限情報
     */
    //Authorizatable getAuthorizationInfo(final Authenticatable baseInfo);

}