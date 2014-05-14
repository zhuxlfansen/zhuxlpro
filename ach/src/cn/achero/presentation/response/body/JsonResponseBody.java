package cn.achero.presentation.response.body;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import cn.achero.common.core.i18n.I18nMessage;


/**
 * @author user
 *
 */
public class JsonResponseBody implements Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 2929732316341369093L;
	
	 /** 状�? */
    public static enum JsonStatus {
        /** OK */
        OK,
        /** NG */
        NG,
        /** checkNG */
        NG_CHECK,
        /** 没有权限 */
        FBD,
        /**  */
        ERR;
    }

    // 状�?
    private JsonStatus status = JsonStatus.OK;
    // message
    private List<I18nMessage> messages = new ArrayList<I18nMessage>();
    // 数据数目
    private int dataCnt = 0;
    // 附加数据
    private Object dataEx = null;
    // 数据
    private List<?> data = null;

    /**
     * 
     */
    public JsonResponseBody() {
    }

    /**
     * 数据设定
     *
     * @param data 数据
     */
    public JsonResponseBody(List<?> data) {
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
     * 增加message
     *
     * @param message 
     */
    public void addMessage(I18nMessage message) {
        this.messages.add(message);
    }

    /**
     * 设定messageList
     *
     * @param msgList 
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
    public List<?> getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(List<?> data) {
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
     * 取得dataEx
     *
     * @return dataEx
     */
    public Object getDataEx() {
        return dataEx;
    }

    /**
     * 设定dataEx
     *
     * @param dataEx dataEx
     */
    public void setDataEx(Object dataEx) {
        this.dataEx = dataEx;
    }

}
