package com.etyy.presentation.duty.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.etyy.common.core.util.FWLogger;
import com.etyy.presentation.common.action.BaseAction;

@Controller
@RequestMapping("/work")
public class DutyAction extends BaseAction {

	@Autowired
	private FWLogger logger;

	@RequestMapping("/duty")
	public String toDuty(ModelMap model) {
		List<Map<String,Object>> mapList = new ArrayList<Map<String,Object>>();
		Map<String,Object> obj = new HashMap<String,Object>();
		obj.put("name", "张三");
		return "duty";
	}

}
