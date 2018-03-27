package com.liheng.dao;

import java.util.List;

import com.liheng.entity.User;

public interface IUserDAO extends IBaseDAO<User>{

	/**
	 * 验证普通用户登录的方法
	 * @param user
	 * @return
	 */
	User login(User user);
	
	/**
	 * 判断用户名是否存在
	 * @param accout
	 * @return
	 */
	boolean checkUserExist(String account);
	
	/**
	 * 验证管理员登录的方法
	 * @param user
	 * @return
	 */
	User adminLogin(User user);
	
	/**
	 * 此方法用于删除单个或多个用户信息
	 * @param list
	 */
	void deleteUser(List<Integer> list);
}
