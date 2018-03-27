package com.liheng.service;

import java.util.List;

import com.liheng.entity.Order;
import com.liheng.entity.User;

public interface IOrderService {
	
	/**
	 * 创建一条订单信息
	 * @param order
	 */
	void saveOrder(Order order);
	
	/**
	 * 根据用户信息查询订单信息
	 * @param id
	 * @return
	 */
	List<Order> getOrderByUser(User user);
	
}
