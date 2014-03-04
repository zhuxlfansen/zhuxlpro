package cn.achero.main.dao.impl;

import cn.achero.main.dao.interfaces.UserDao;
import cn.achero.main.dao.mapper.UserMapper;

public class UserDaoImpl implements UserDao {

	private UserMapper userMapper;

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

}
