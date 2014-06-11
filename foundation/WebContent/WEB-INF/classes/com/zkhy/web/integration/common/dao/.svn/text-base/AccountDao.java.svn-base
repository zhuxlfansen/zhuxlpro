package com.zkhy.web.integration.common.dao;

import java.util.Map;

import com.zkhy.web.integration.common.entity.AccountUserEntity;
import com.zkhy.fw.integration.dao.annotation.DaoMaster;

@DaoMaster
public interface AccountDao {
    /**
     * キー：ユーザID
     */
    String KEY_USER_ID = "userId";
    /**
     * キー：パスワード
     */
    String KEY_PASSWORD = "password";
    /**
     * きー：延長
     */
    String KEY_EXTENDED = "extended";

    /**
     * ユーザIDによって、ユーザ情報を取得する。
     *
     * @param param パラメータ
     * @return ユーザ情報
     */
    AccountUserEntity getUserInfo(Map<String, String> condition);
}
