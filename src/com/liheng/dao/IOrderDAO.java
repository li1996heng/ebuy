package com.liheng.dao;

import java.util.List;

import com.liheng.entity.Order;
import com.liheng.entity.User;

public interface IOrderDAO extends IBaseDAO<Order>{

	/**
	 * 根据用户信息查询订单信息
	 * @param id
	 * @return
	 */
	List<Order> getOrderByUser(User user);
}
