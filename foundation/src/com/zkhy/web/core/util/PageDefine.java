package com.zkhy.web.core.util;

/**
 * ページURL定義ENUM
 *
 * @author guozhiqiang
 *
 */
public enum PageDefine {

    /**
     * システムページ
     */
    SYSTEM_ERROR("error/system_error"),
    /**
     * ホーム
     */
    Index("index"),
    /**
     * ログインページ
     */
    Login("index");

    private String url = null;
    private String baseActionUrl = null;

    private PageDefine(String url, String baseActionUrl) {
        this.url = url;
        this.baseActionUrl = baseActionUrl;
    }

    private PageDefine(String url) {
        this.url = url;
        this.baseActionUrl = "";
    }

    /**
     * URLを返却する
     *
     * @return URL
     */
    public final String getBaseActionUrl() {
        return this.baseActionUrl;
    }

    /**
     * URLを返却する
     *
     * @return URL
     */
    public final String getUrl() {
        return this.url;
    }
}
