package com.zkhy.business.manager.impl;

import java.util.List;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import unis.base.util.PageResult;
import unis.base.util.ValidateUtil;

import com.zkhy.business.manager.ManagerService;
import com.zkhy.integration.manager.dao.ManagerMapper;
import com.zkhy.integration.manager.dao.seachObj.ManagerSeachObj;
import com.zkhy.presentation.manager.form.Manager;

@Service
public class ManagerServiceImpl implements ManagerService {
	
	public static final String  STATUS_NORMAL = "1";
	
	public static final String  STATUS_FROZEN = "2";
	
	public static final String  NEW_PASSWORD = "a12345";
	
	@Autowired
	private ManagerMapper managerMapper; 
	

	@Override
	public int saveManager(Manager manager) {
		
		return managerMapper.insertSelective(manager);
	}


	@Override
	public Manager checkUserName(String userName) {
		
		return managerMapper.findManagerByUserName(userName);
	}


	@Override
	public PageResult getAllManager(String username,String managerGrade,String managerClass,String status,
			int curPage, int pageSize) {
		
		int offset = getOffset(curPage, pageSize);
		
		ManagerSeachObj obj = new ManagerSeachObj();
		if(ValidateUtil.isNotNull(username)){
			obj.username=username;
		}
		if(ValidateUtil.isNotNull(managerGrade)){
			obj.managerGrade=managerGrade;
		}
		if(ValidateUtil.isNotNull(managerClass)){
			obj.managerClass = managerClass;
		}
		if(ValidateUtil.isNotNull(status)){
			obj.status = status;
		}
		
		obj.offset = offset;
		obj.limit = pageSize;
		
		int count = managerMapper.getAllManagerCount(obj);
		
		List<Manager> managerList = managerMapper.getAllManager(obj);
		
		return new PageResult(managerList, count, pageSize, curPage);
	}

	@Override
	public Manager findManagerById(int id) {
		return managerMapper.selectByPrimaryKey(id);
	}

	private int getOffset(int curPage, int pageSize) {
		int offset = 0;
		if (curPage > 0) {
			offset = (curPage - 1) * pageSize;
		}
		return offset;
	}


	@Override
	public int frozenAccount(Manager manager) {
		manager.setStatus(STATUS_FROZEN);
		return managerMapper.updateByPrimaryKeySelective(manager);
	}


	@Override
	public int thawAccount(Manager manager) {
		manager.setStatus(STATUS_NORMAL);
		return managerMapper.updateByPrimaryKeySelective(manager);
	}


	@Override
	public int resetpwd(Manager manager) {
		SimpleHash hash = new SimpleHash("MD5", NEW_PASSWORD, 1);
		String md5Password = hash.toHex();
		manager.setPassword(md5Password);
		return managerMapper.updateByPrimaryKeySelective(manager);
	}


	@Override
	public int updateManager(Manager manager) {
		
		return managerMapper.updateByPrimaryKeySelective(manager);
	}

}
