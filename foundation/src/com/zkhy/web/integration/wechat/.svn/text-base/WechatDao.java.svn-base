package com.zkhy.web.integration.wechat;


import java.util.Map;

import com.zkhy.fw.integration.dao.annotation.DaoMaster;
import com.zkhy.web.presentation.wechat.form.DynamicForm;

@DaoMaster
public interface WechatDao {

    public int getExistByWechatCode(String wechatCode);
    
    public Map<String,Object> getUserInfoByUserId(String userId);
    
    public int updateWechatCode(Map<String,Object> map);
    
    public Map<String,Object> getUserInfoByWechatCode(String wechatCode);
    
    public int pushSQInfo(DynamicForm dynabic);
}
