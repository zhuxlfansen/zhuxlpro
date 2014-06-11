package com.zkhy.presentation.manager.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import unis.base.util.PageResult;
import unis.base.util.StringUtil;
import unis.base.util.ValidateUtil;

import com.zkhy.business.manager.ManagerService;
import com.zkhy.common.core.util.ClassListObject;
import com.zkhy.presentation.common.action.BaseAction;
import com.zkhy.presentation.manager.form.Manager;

/**
 * 管理员Action类
 * @author ustc
 *
 */
@Controller
public class ManagerAction extends BaseAction{
	
	@Autowired
	private ManagerService  managerService;
	
	private int pageSize = 10;
	private int curPage = 1;
	
	@RequestMapping("/addManager")
	public String saveManager(@ModelAttribute("manager") Manager manager,
			ModelMap model){
		// MD5加密
		SimpleHash hash = new SimpleHash("MD5", manager.getPassword(), 1);
		String md5Password = hash.toHex();
		manager.setPassword(md5Password);
		managerService.saveManager(manager);
		return "redirect:/toManagerList";
	}
	
	@RequestMapping("/toAddManager")
	public String toAddManagerPage(ModelMap model){
		model.addAttribute("classList", ClassListObject.getClassList());
		return "addManager";
	}
	
	@RequestMapping("/toUpdateManager")
	public String toUpdateManager(ModelMap model , String id){
		Manager manager = managerService.findManagerById(StringUtil.parseInteger(id));
		model.addAttribute("manager", manager);
		model.addAttribute("classList", ClassListObject.getClassList());
		return "updateManager";
	}
	
	@RequestMapping("/updateManager")
	public String updateManager(@ModelAttribute("manager") Manager manager){
		managerService.updateManager(manager);
		return "redirect:/toManagerList";
	}
	
	@RequestMapping("/toManagerList")
	public String toManagerList(ModelMap model, String curpage, String username,
			String managerGrade, String managerClass, String status) {
		if (ValidateUtil.isNotNull(curpage) && curpage.length() > 0) {
			curPage = StringUtil.parseInteger(curpage);
		}
		PageResult managerPage = managerService.getAllManager(username,managerGrade,managerClass,status, curPage, pageSize);
		model.addAttribute("managerPage", managerPage);
		model.addAttribute("username", username);
		model.addAttribute("managerGrade", managerGrade);
		model.addAttribute("managerClass", managerClass);
		model.addAttribute("status", status);
		model.addAttribute("classList", ClassListObject.getClassList());
		return "managerList";
	}
	
	
	
	@RequestMapping("/frozenAccounts")
	public String frozenAccounts(ModelMap model , String id){
		Manager manager = managerService.findManagerById(StringUtil.parseInteger(id));
		managerService.frozenAccount(manager);
		return "redirect:/toManagerList";
	}
	
	@RequestMapping("/thawAccount")
	public String thawAccount(ModelMap model , String id){
		Manager manager = managerService.findManagerById(StringUtil.parseInteger(id));
		managerService.thawAccount(manager);
		return "redirect:/toManagerList";
	}
	
	@RequestMapping("/resetPassword")
	public String resetPassword(ModelMap model , String id){
		Manager manager = managerService.findManagerById(StringUtil.parseInteger(id));
		managerService.resetpwd(manager);
		return "redirect:/toManagerList";
	}
	
	
	@RequestMapping("/checkUserName")
	public void checkUserName(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		String message = "newRecord";
		String userName = request.getParameter("userName");
		Manager manager = managerService.checkUserName(userName);
		if(ValidateUtil.isNotNull(manager)){
			message = "exist";
		}
		response.getWriter().write(message);		
		
	}

}
