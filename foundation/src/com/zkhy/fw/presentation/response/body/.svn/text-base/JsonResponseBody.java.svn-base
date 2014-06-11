package com.zkhy.fw.presentation.response.body;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.zkhy.fw.core.i18n.I18nMessage;
import com.zkhy.fw.presentation.response.support.JsonResponseSupport;

/**
 * クライアント通信用JSONデータ
 *
 * @author guozhiqiang
 *
 */
public class JsonResponseBody implements Serializable {
    /**
    *
    */
    private static final long serialVersionUID = -9161048428065557909L;

    /** アクセス結果 */
    public static enum JsonStatus {
        /** OK */
        OK,
        /** NG */
        NG,
        /** チェックNG */
        NG_CHECK,
        /** 権限制御 */
        FBD,
        /**  */
        ERR;
    }

    // アクセス結果
    private JsonStatus status = JsonStatus.OK;
    // メッセージ
    private List<I18nMessage> messages = new ArrayList<I18nMessage>();
    // データCount
    private int dataCnt = 0;
    // その他データ
    private Object dataEx = null;
    // データ
    private List<? extends JsonResponseSupport> data = null;

    /**
     * コンストラクタ
     */
    public JsonResponseBody() {
    }

    /**
     * コンストラクタ
     *
     * @param data データ
     */
    public JsonResponseBody(List<JsonResponseSupport> data) {
        this.status = JsonStatus.OK;
        this.data = data;
        this.dataCnt = (data == null) ? 0 : data.size();
    }

    /**
     * @return the status
     */
    public JsonStatus getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(JsonStatus status) {
        this.status = status;
    }

    /**
     * @return the messages
     */
    public List<I18nMessage> getMessages() {
        return messages;
    }

    /**
     * メッセージを追加する。
     *
     * @param message メッセージ
     */
    public void addMessage(I18nMessage message) {
        this.messages.add(message);
    }

    /**
     * メッセージリストを追加する。
     *
     * @param msgList メッセージリスト
     */
    public void addMessage(List<I18nMessage> msgList) {
        this.messages.addAll(msgList);
    }

    /**
     * @param messages the messages to set
     */
    public void setMessages(List<I18nMessage> messages) {
        this.messages = messages;
    }

    /**
     * @return the data
     */
    public List<? extends JsonResponseSupport> getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(List<? extends JsonResponseSupport> data) {
        this.data = data;
    }

    /**
     * @return the dataCnt
     */
    public int getDataCnt() {
        return dataCnt;
    }

    /**
     * @param dataCnt the dataCnt to set
     */
    public void setDataCnt(int dataCnt) {
        this.dataCnt = dataCnt;
    }

    /**
     * dataExを返却する。
     *
     * @return dataEx
     */
    public Object getDataEx() {
        return dataEx;
    }

    /**
     * dataExをセットする。
     *
     * @param dataEx dataEx
     */
    public void setDataEx(Object dataEx) {
        this.dataEx = dataEx;
    }

}