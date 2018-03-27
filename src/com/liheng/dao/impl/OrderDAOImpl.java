package com.liheng.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.liheng.dao.IOrderDAO;
import com.liheng.entity.Cart;
import com.liheng.entity.Order;
import com.liheng.entity.User;

@Repository
public class OrderDAOImpl extends BaseDAOImpl<Order> implements IOrderDAO{

	public List<Order> getOrderByUser(User user) {
		// TODO Auto-generated method stub
		String hql = "from Order o where o.cart.user.ID = ?";
		List<Order> find = (List<Order>) getHibernateTemplate().find(hql, user.getID());
		if(find.size() > 0) {
			return find;
		}
		return null;
	}

}
