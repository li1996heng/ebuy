package com.liheng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liheng.dao.IOrderDAO;
import com.liheng.entity.Order;
import com.liheng.entity.User;
import com.liheng.service.IOrderService;

@Service
public class OrderServiceImpl implements IOrderService{

	@Autowired
	private IOrderDAO orderDAO;
	
	public void saveOrder(Order order) {
		// TODO Auto-generated method stub
		orderDAO.save(order);
	}

	public List<Order> getOrderByUser(User user) {
		// TODO Auto-generated method stub
		return orderDAO.getOrderByUser(user);
	}

}
