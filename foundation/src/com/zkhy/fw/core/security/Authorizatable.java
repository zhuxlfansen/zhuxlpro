package com.zkhy.fw.core.security;

import java.io.Serializable;
import java.util.List;

/**
 * ユーザ権限インタフェース
 *
 * @author guozhiqiang
 */
public interface Authorizatable extends Serializable {

    /**
     * ユーザ権限リストを取得する。
     *
     * @return ユーザ権限リスト
     */
    List<String> getPermissions();

    /**
     * ユーザRoleリストを取得する。
     *
     * @return ユーザRoleリスト
     */
    List<String> getRoles();
}
