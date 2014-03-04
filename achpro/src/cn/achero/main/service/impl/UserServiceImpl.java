package cn.achero.main.service.impl;

import cn.achero.main.dao.interfaces.UserDao;
import cn.achero.main.service.interfaces.UserService;

public class UserServiceImpl implements UserService {

	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	
}
