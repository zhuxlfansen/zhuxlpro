//******************************************************************************
// Copyright (C) 2014 中科瀚云, All Rights Reserved.
//******************************************************************************
package com.zkhy.web.business.index.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zkhy.web.business.index.IndexService;
import com.zkhy.web.core.util.DateUtil;
import com.zkhy.web.integration.index.dao.TimeLineDao;
import com.zkhy.web.integration.index.dao.TimeLineDetailDao;
import com.zkhy.web.integration.index.entity.TimeLineDetailEntity;
import com.zkhy.web.integration.index.entity.TimeLineEntity;
import com.zkhy.web.presentation.index.form.IndexForm;
import com.zkhy.web.presentation.index.form.TimeLineDetailForm;
import com.zkhy.web.presentation.index.form.TimeLineForm;

/**
 * @author guozhiqiang
 *
 */
@Service
public class IndexServiceImpl implements IndexService {

    @Autowired
    private TimeLineDao timeLineDao;
    
    @Autowired
    private TimeLineDetailDao timeLineDetailDao;
    
    @Override
    public void getTimeLine(IndexForm form) {
        Map<TimeLineForm, List<TimeLineDetailForm>> indexTimeLine = new HashMap<TimeLineForm, List<TimeLineDetailForm>>();
        List<TimeLineEntity> timelines = timeLineDao.selectAll();
        List<TimeLineDetailEntity> timelineDetails = timeLineDetailDao.selectAll();
        int activityIndex = 0;
        List<TimeLineDetailForm> details = null;
        TimeLineForm lastForm = null;
        for (TimeLineEntity timeline : timelines) {
            details = new ArrayList<TimeLineDetailForm>();
            TimeLineForm timeLineForm = new TimeLineForm();
            entity2Form(timeline, timeLineForm);
            lastForm = timeLineForm;
            for (int i = activityIndex; i < timelineDetails.size(); i++) {
                TimeLineDetailEntity curr = timelineDetails.get(i);
                TimeLineDetailForm currForm = new TimeLineDetailForm();
                entity2Form(curr, currForm);
                if (curr.getDateId() == timeline.getDateId()) {
                    details.add(currForm);
                } else {
                    activityIndex = i;
                    indexTimeLine.put(timeLineForm, details);
                    break;
                }
            }
        }
        indexTimeLine.put(lastForm, details);
        form.setTimeline(indexTimeLine);
    }

    
    private void entity2Form(TimeLineEntity entity, TimeLineForm form) {
        if (entity == null || form == null) {
            return;
        }
        form.setDateId(entity.getDateId());
        if (entity.getDateStart() != null) {
            form.setDateStart(DateUtil.DateFormat.DATE_4.format(entity.getDateStart()));
        }
        if (entity.getDateEnd() != null) {
            form.setDateEnd(DateUtil.DateFormat.DATE_4.format(entity.getDateEnd()));
        }
    }
    
    private void entity2Form(TimeLineDetailEntity entity, TimeLineDetailForm form) {
        if (entity == null || form == null) {
            return;
        }
        form.setDateId(entity.getDateId());
        form.setActivityId(entity.getActivityId());
        if (entity.getActivityStart() != null) {
            form.setActivityStart(DateUtil.DateFormat.TIME_1.format(entity.getActivityStart()));
        }
        if (entity.getActivityEnd() != null) {
            form.setActivityEnd(DateUtil.DateFormat.TIME_1.format(entity.getActivityEnd()));
        }
        form.setActivityContent(entity.getActivityContent());
    }
}
