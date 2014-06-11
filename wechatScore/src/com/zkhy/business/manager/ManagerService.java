package com.zkhy.business.manager;

import unis.base.util.PageResult;

import com.zkhy.presentation.manager.form.Manager;

public interface ManagerService {
	
	/**
	 * 初始化二级管理员
	 * @param manager
	 * @return
	 */
	public int saveManager(Manager manager);
	
	/**
	 * 根据用户名查询用户
	 * @param userName
	 * @return
	 */
	public Manager checkUserName(String userName);
	
	/**
	 * 联合查询管理员
	 * @param username      用户名
	 * @param managerGrade  年级
	 * @param managerClass  班级
	 * @param status        状态
	 * @param curPage       当前页
	 * @param pageSize      一页显示数
	 * @return
	 */
	public PageResult  getAllManager(String username,String managerGrade,String managerClass,String status,int curPage,int pageSize);
	
	/**
	 * 根据id查询用户
	 * @param id
	 * @return
	 */
	public Manager findManagerById(int id);

	/**
	 * 冻结用户
	 * @param manager
	 * @return
	 */
	public int frozenAccount(Manager manager);
	
	/**
	 * 解冻用户
	 * @param manager
	 * @return
	 */
	public int thawAccount(Manager manager);
	
	/**
	 * 重置密码  a12345
	 * @param manager
	 * @return
	 */
	public int resetpwd(Manager manager);
     
	/**
	 * 修改用户
	 * @param manager
	 * @return
	 */
	public int updateManager(Manager manager);

}
