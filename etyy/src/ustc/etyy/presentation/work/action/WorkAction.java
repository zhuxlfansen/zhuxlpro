package ustc.etyy.presentation.work.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ustc.etyy.business.work.SchedulingService;
import ustc.etyy.common.util.Pager;
import ustc.etyy.presentation.common.action.BaseAction;
import ustc.etyy.presentation.work.form.OrderForm;

@Controller
@RequestMapping("/work")
public class WorkAction extends BaseAction {
	
	@Autowired
	private SchedulingService schedulingService;
	
	private int pageIndex = 1;
	private static final int pageSize = 20;
	
	@RequestMapping("/schedulingList")
	public String schedulingList(ModelMap model){
		model.addAttribute("pList", schedulingService.queryParentKS());
		model.addAttribute("pmzList", schedulingService.queryParentMZ());
		model.addAttribute("eList", schedulingService.queryExpert(null));
		return "schedulingList";
	}
	
	@RequestMapping("/queryChildKSByPID")
	@ResponseBody
	public List<Map<String,Object>> queryChildKSByPID(int pId){
		List<Map<String,Object>> mapList = schedulingService.queryChildKSByPID(pId);
		return mapList;
	}
	
	@RequestMapping("/queryExpertByKSID")
	@ResponseBody
	public List<Map<String,Object>> queryExpertByKSID(int ksId){
		List<Map<String,Object>> mapList =null;
		if(ksId==-1){
			mapList = schedulingService.queryExpert(null);
		}else{
			mapList = schedulingService.queryExpert(ksId);
		}
		return mapList;
	}
	
	@RequestMapping("/queryChildMZByPID")
	@ResponseBody
	public List<Map<String,Object>> queryChildMZByPID(int pId){
		List<Map<String,Object>> mapList = schedulingService.queryChildMZByPID(pId);
		return mapList;
	}
	
	@RequestMapping("/doScheduling")
	@ResponseBody
	public Map<String,Object> doScheduling(Integer eId,Integer apm,Integer week,Integer mzId){
		try {
			schedulingService.createScheduling(eId, apm, week, mzId);
			return schedulingService.queryMZById(mzId);
		} catch (Exception e) {
			return null;
		}
	}
	
	@RequestMapping("/delScheduling")
	@ResponseBody
	public String delScheduling(Integer eId,Integer apm,Integer week){
		try {
			schedulingService.delScheduling(eId, apm, week);
			return "success";
		} catch (Exception e) {
			return "error";
		}
	}
	
	@RequestMapping("/schedulingTable")
	public String schedulingTable(ModelMap model){
		List<Map<String,Object>> mapList = schedulingService.querySchedulingTable();
		model.addAttribute("list", JSONArray.fromObject(mapList).toString().replaceAll("\"", "\'"));
		return "schedulingTable";
	}
	
	@RequestMapping("/order")
	public String order(ModelMap model){
		model.addAttribute("mzList", schedulingService.queryAllMz());
		return "order";
	}
	
	@RequestMapping("/createOrder")
	public String createOrder(OrderForm orderForm,@RequestParam(value ="dateSel") String dateSel,ModelMap model){
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = (Date)sdf.parse(dateSel);
			orderForm.setOrderDate(date);
			schedulingService.insertOrder(orderForm);
			model.addAttribute("msg", "success");
		} catch (ParseException e) {
			e.printStackTrace();
			model.addAttribute("msg", "error");
		}
		return "result";
	}
	
	@RequestMapping("/queryExpertForOrder")
	@ResponseBody
	public List<Map<String,Object>> queryExpertForOrder(Integer mzId,Integer apm,String dateSel){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date = (Date)sdf.parse(dateSel);
			return schedulingService.queryExpertByParam(date, apm, mzId);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	@RequestMapping("/queryOrderList")
	public String queryOrderList(String arg,Integer pageIndex2,Integer pageSize2,ModelMap model){
		Map<String,Object> map = new HashMap<String,Object>();
		if(arg!=null&&!arg.equals("")){
			map.put("param", arg);
			model.addAttribute("arg", arg);
		}
		model.addAttribute("page", schedulingService.queryOrderList(map, pageIndex2==null?pageIndex:pageIndex2, pageSize2==null?pageSize:pageSize2));
		return "orderList";
	}
}
