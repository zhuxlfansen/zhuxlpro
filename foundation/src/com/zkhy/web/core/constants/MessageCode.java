package com.zkhy.web.core.constants;

import com.zkhy.fw.core.i18n.I18nCode;

/**
 * メッセージ定義クラス
 *
 * @author CTC
 *
 */
public enum MessageCode implements I18nCode {
    /** login error */
    I001001("I001001"),
    /** 上記以外 */
    UNKNOW("UNKNOW");

    private String code = null;

    private MessageCode(String code) {
        this.code = code;
    }

    @Override
    public String getCode() {
        return this.code;
    }

    /**
     * メッセージコードStringより、Enumを取得する。
     *
     * @param messageCode メッセージコードString
     * @return メッセージコード
     */
    public static MessageCode parse(String messageCode) {
        for (MessageCode code : MessageCode.values()) {
            if (code.getCode().equals(messageCode)) {
                return code;
            }
        }
        return UNKNOW;
    }
}