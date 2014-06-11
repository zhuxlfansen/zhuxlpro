package com.zkhy.web.integration.common.entity;

import com.zkhy.fw.integration.entity.BaseMasterEntity;

/**
 * ログインユーザEntity
 *
 * @author guozhiqiang
 */
public class AccountUserEntity extends BaseMasterEntity {
    /**
     * シリアルID
     */
    private static final long serialVersionUID = -2603992737480169667L;
    // ユーザID
    private String userId;
    // ユーザ名
    private String userName;
    // パスワード
    private String password;
    // 角色
    private String userRole;
    /**
     * userIdを返却する。
     *
     * @return userId
     */
    public String getUserId() {
        return userId;
    }
    /**
     * userIdをセットする。
     * @param userId userId
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }
    /**
     * userNameを返却する。
     *
     * @return userName
     */
    public String getUserName() {
        return userName;
    }
    /**
     * userNameをセットする。
     * @param userName userName
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }
    /**
     * passwordを返却する。
     *
     * @return password
     */
    public String getPassword() {
        return password;
    }
    /**
     * passwordをセットする。
     * @param password password
     */
    public void setPassword(String password) {
        this.password = password;
    }
    /**
     * userRoleを返却する。
     *
     * @return userRole
     */
    public String getUserRole() {
        return userRole;
    }
    /**
     * userRoleをセットする。
     * @param userRole userRole
     */
    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

}