package com.etyy.presentation.duty.action;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etyy.business.duty.DutyService;
import com.etyy.common.core.util.FWLogger;
import com.etyy.presentation.common.action.BaseAction;

@Controller
@RequestMapping("/work")
public class DutyAction extends BaseAction {

	@Autowired
	private FWLogger logger;
	@Autowired
	private DutyService dutyService;

	@RequestMapping("/duty")
	public String toDuty(ModelMap model) {
		List<Map<String,Object>> mapList = dutyService.selectDocList();
		/*Map<String,Object> obj = new HashMap<String,Object>();
		obj.put("name", "张三");*/
//		List<Map<String,Object>> dutyList1 =null;
//		List<Map<String,Object>> dutyList2 =null;
//		for(Map<String,Object> m:mapList){
//			dutyList1 = dutyService.selectByExpId((Integer)m.get("id"));
//			dutyList2 = new ArrayList<Map<String,Object>>();
//			if(dutyList1.size()>0){
//				for(int i=0;i<7;i++){
//					for(int j=0;j<dutyList1.size();j++){
//						if(((String)dutyList1.get(j).get("week")).equals(i+1+"")){
//							dutyList2.add(dutyList1.get(j));
//						}else{
//							dutyList2.add(i, null);
//						}
//					}
//				}
//			}else{
//				for(int i=0;i<7;i++){
//					dutyList2.add(i,null);
//				}
//			}
//			m.put("list", dutyList2);
//		}
		model.addAttribute("dutyList", JSONArray.fromObject(dutyService.selectAllDuty()).toString().replaceAll("\"", "\'"));
		model.addAttribute("expList", JSONArray.fromObject(mapList).toString().replaceAll("\"", "\'"));
		model.addAttribute("list", mapList);
		return "duty";
	}
	
	@RequestMapping("/doDuty")
	@ResponseBody
	public String doDuty(int id,int apm,String week){
		
		try {
			dutyService.doDuty(id, apm, week);
			return "success";
		} catch (Exception e) {
			logger.equals(e);
			return "error";
		}
		
	}
	
	@RequestMapping("/queryList")
	public String queryList(ModelMap model){
		List<Map<String,Object>> mapList = null;
		Set<Map<String,Object>> deptSet=null;
		Map<String,Object> setMap=null;
		//知名专家
		mapList=dutyService.queryDutyList1(1,0,0,0,0);
        model.addAttribute("list1",  JSONArray.fromObject(dutyService.queryDutyList1(1,0,0,0,0)).toString().replaceAll("\"", "\'"));
        deptSet =new HashSet<Map<String,Object>>();
        if(mapList.size()>0){
        	for(Map<String,Object> m:mapList){
        		setMap=new HashMap<String,Object>();
        		setMap.put("deptName", m.get("deptName"));
        		setMap.put("deptId", m.get("deptId"));
            	deptSet.add(setMap);
            }
        }
        model.addAttribute("list1_0",  deptSet);
        model.addAttribute("list1_1",  JSONArray.fromObject(deptSet).toString().replaceAll("\"", "\'"));
        //内科专家
        model.addAttribute("list2",  JSONArray.fromObject(dutyService.queryDutyList1(0,1,0,0,0)).toString().replaceAll("\"", "\'"));
        //内科专科
        mapList=dutyService.queryDutyList1(0,1,0,1,0);
        model.addAttribute("list3",  JSONArray.fromObject(mapList).toString().replaceAll("\"", "\'"));
        deptSet =new HashSet<Map<String,Object>>();
        if(mapList.size()>0){
        	for(Map<String,Object> m:mapList){
        		setMap=new HashMap<String,Object>();
        		setMap.put("deptName", m.get("deptName"));
        		setMap.put("deptId", m.get("deptId"));
            	deptSet.add(setMap);
            }
        }
        model.addAttribute("list3_1",  JSONArray.fromObject(deptSet).toString().replaceAll("\"", "\'"));
        
        //外科专科
        mapList=dutyService.queryDutyList1(0,0,1,1,0);
        model.addAttribute("list4",  JSONArray.fromObject(mapList).toString().replaceAll("\"", "\'"));
        deptSet =new HashSet<Map<String,Object>>();
        if(mapList.size()>0){
        	for(Map<String,Object> m:mapList){
        		setMap=new HashMap<String,Object>();
        		setMap.put("deptName", m.get("deptName"));
        		setMap.put("deptId", m.get("deptId"));
            	deptSet.add(setMap);
            }
        }
        model.addAttribute("list4_1",  JSONArray.fromObject(deptSet).toString().replaceAll("\"", "\'"));
        //其他
        mapList=dutyService.queryDutyList1(0,0,0,0,1);
        model.addAttribute("list5",  JSONArray.fromObject(mapList).toString().replaceAll("\"", "\'"));
        deptSet =new HashSet<Map<String,Object>>();
        if(mapList.size()>0){
        	for(Map<String,Object> m:mapList){
        		setMap=new HashMap<String,Object>();
        		setMap.put("deptName", m.get("deptName"));
        		setMap.put("deptId", m.get("deptId"));
            	deptSet.add(setMap);
            }
        }
        model.addAttribute("list5_1",  JSONArray.fromObject(deptSet).toString().replaceAll("\"", "\'"));
		return "dutyList";
	}
	
	@RequestMapping("/form")
	public String form(ModelMap model){
		return "form";
	}

}
