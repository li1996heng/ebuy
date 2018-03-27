package com.liheng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liheng.dao.IUserDAO;
import com.liheng.entity.User;
import com.liheng.service.IUserService;
import com.liheng.util.PageBean;

@Service
public class UserServiceImpl implements IUserService{

	@Autowired
	private IUserDAO userDao;
	
	public User login(User user) {
		// TODO Auto-generated method stub
		return userDao.login(user);
	}

	public void register(User user) {
		// TODO Auto-generated method stub
		userDao.save(user);
	}

	public boolean checkUserExist(String account) {
		// TODO Auto-generated method stub
		return userDao.checkUserExist(account);
	}

	public User adminLogin(User user) {
		// TODO Auto-generated method stub
		return userDao.adminLogin(user);
	}

	public PageBean<User> getAllUserByPage(Integer currentPage,Integer pageSize) {
		String hql = "from User u where u.status = 1";
		return userDao.pageQuery(hql, pageSize, currentPage, null);
	}

	public void deleteUser(List<Integer> list) {
		// TODO Auto-generated method stub
		userDao.deleteUser(list);
	}

	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userDao.update(user);
	}

	public User getUserByID(Integer id) {
		// TODO Auto-generated method stub
		return userDao.findById(id);
	}
	
	
}
