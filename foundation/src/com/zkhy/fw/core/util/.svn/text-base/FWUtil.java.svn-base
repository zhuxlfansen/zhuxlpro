package com.zkhy.fw.core.util;

import java.io.IOException;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.http.converter.HttpMessageNotWritableException;

import com.zkhy.fw.core.security.Authenticatable;
import com.zkhy.fw.presentation.response.body.JsonResponseBody;

/**
 * フレームワーク用Utilクラス
 *
 * @author guozhiqiang
 *
 */
public final class FWUtil {
    private FWUtil() {
    }

    /**
     * Ajaxリクエストかどうかを判断する
     *
     * @param httpReq リクエスト
     * @return 判断結果
     */
    public static boolean isAjaxRequest(HttpServletRequest httpReq) {
        // x-requested-with
        String xReqWith = httpReq.getHeader("x-requested-with");
        // ブランクではない場合、TRUE　：　XMLHttpRequestなど
        // echonetLite add by zhangxiangjiang 2013/11/22 start
        // x-requested-with=com.android.browser
       // return !StringUtils.isEmpty(xReqWith);
        return "XMLHttpRequest".equals(xReqWith);
        // echonetLite add by zhangxiangjiang 2013/11/22 end
    }

    /**
     * Jsonデータを返す。
     *
     * @param response レスポンス
     * @param data データ
     */
    public static void outputJson(ServletResponse response, JsonResponseBody data) {
        // Jsonの場合、ErrorJsonデータを返す
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        try {
            ObjectMapper jsMaper = new ObjectMapper();
            JsonGenerator jsonGenerator =
                jsMaper.getJsonFactory().createJsonGenerator(response.getOutputStream(), JsonEncoding.UTF8);

            jsMaper.writeValue(jsonGenerator, data);
        } catch (IOException ex) {
            throw new HttpMessageNotWritableException("Could not write JSON: " + ex.getMessage(), ex);
        }
    }

//
//    public static void setExpiresHeader(HttpServletResponse response, long expiresSeconds) {
//        // Http 1.0 header, set a fix expires date.
//        response.setDateHeader("Expires", System.currentTimeMillis() + expiresSeconds * 1000);
//        // Http 1.1 header, set a time after now.
//        response.setHeader("Cache-Control", "private, max-age=" + expiresSeconds);
//    }
//
//    public static void setNoCacheHeader(HttpServletResponse response) {
//        // Http 1.0 header
//        response.setDateHeader("Expires", 1L);
//        response.addHeader("Pragma", "no-cache");
//        // Http 1.1 header
//        response.setHeader("Cache-Control", "no-cache, no-store, max-age=0");
//    }

    /**
     * カレントユーザ認証情報を取得する。
     *
     * @return ユーザ認証情報
     */
    public static Authenticatable getCurrentAuthenticationInfo() {
        // サブジェクト
        Subject subject = SecurityUtils.getSubject();
        // 検証ユーザ情報
        return (Authenticatable) subject.getPrincipal();
    }

    /**
     * ログアウト処理
     */
    public static void logout() {
        // サブジェクト
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
    }
}
