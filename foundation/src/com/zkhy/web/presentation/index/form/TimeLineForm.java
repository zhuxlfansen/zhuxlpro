package com.zkhy.web.presentation.index.form;

import com.zkhy.fw.presentation.form.BaseForm;

public class TimeLineForm extends BaseForm {
    private static final long serialVersionUID = -5791886490654530524L;

    private int dateId;

    private String dateStart;

    private String dateEnd;

    /**
     * 返回dateId
     *
     * @return dateId
     */
    public int getDateId() {
        return dateId;
    }

    /**
     * 设置dateId
     * @param dateId dateId
     */
    public void setDateId(int dateId) {
        this.dateId = dateId;
    }

    /**
     * 返回dateStart
     *
     * @return dateStart
     */
    public String getDateStart() {
        return dateStart;
    }

    /**
     * 设置dateStart
     * @param dateStart dateStart
     */
    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    /**
     * 返回dateEnd
     *
     * @return dateEnd
     */
    public String getDateEnd() {
        return dateEnd;
    }

    /**
     * 设置dateEnd
     * @param dateEnd dateEnd
     */
    public void setDateEnd(String dateEnd) {
        this.dateEnd = dateEnd;
    }

}