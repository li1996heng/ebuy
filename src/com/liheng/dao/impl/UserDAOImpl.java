package com.liheng.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.liheng.dao.IUserDAO;
import com.liheng.entity.User;

@Repository
public class UserDAOImpl extends BaseDAOImpl<User> implements IUserDAO{

	public User login(User user) {
		String hql = "from User u where u.account = ? and u.password = ? and u.isDelete = 1";
		List<User> list = (List<User>) getHibernateTemplate().find(hql, user.getAccount(),user.getPassword());
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public boolean checkUserExist(String account) {
		String hql = "from User u where u.account = ?";
		List<User> list = (List<User>) getHibernateTemplate().find(hql, account);
		if(list.size() > 0) {
			return true;
		}
		return false;
	}

	public User adminLogin(User user) {
		String hql = "from User u where u.account = ? and u.password = ? and u.status = 2";
		List<User> list = (List<User>) getHibernateTemplate().find(hql, user.getAccount(),user.getPassword());
		if(list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public void deleteUser(List<Integer> list) {
		//确定集合不为null且有值
		if(list.size() > 0 && list != null) {
			//当list集合包含有多个数据  做批量逻辑删除操作
			if(list.size() > 1) {
				String hql = "update User u set u.isDelete = 0 where u.ID in (:ids)";
				Query query = getSession().createQuery(hql);
				query.setParameterList("ids", list);
				query.executeUpdate();
			}
			//当list集合中只有1个数据，做单条逻辑删除操作
			if(list.size() == 1) {
				String hql = "update User u set u.isDelete = 0 where u.ID = "+list.get(0);
				getSession().createQuery(hql).executeUpdate();
			}
		}
	}
	
}
