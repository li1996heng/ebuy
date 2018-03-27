package com.liheng.service;

import java.util.List;

import com.liheng.entity.User;
import com.liheng.util.PageBean;

public interface IUserService {
	/**
	 * 处理普通用户登录的业务方法
	 * @param user
	 * @return
	 */
	User login(User user);
	
	/**
	 * 处理用户注册的业务方法
	 * @param user
	 */
	void register(User user);
	
	/**
	 * 判断用户名是否存在的业务方法
	 * @param account
	 * @return
	 */
	boolean checkUserExist(String account);
	
	/**
	 * 处理管理员登录的业务方法
	 * @param user
	 * @return
	 */
	User adminLogin(User user);
	
	/**
	 * 分页查询所有用户信息
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	PageBean<User> getAllUserByPage(Integer currentPage,Integer pageSize);
	
	/**
	 * 删除单条或多条用户信息
	 * @param list
	 */
	void deleteUser(List<Integer> list);
	
	/**
	 * 更新用户信息
	 * @param user
	 */
	void updateUser(User user);
	
	/**
	 * 根据ID得到用户信息
	 * @param id
	 * @return
	 */
	User getUserByID(Integer id);
}
