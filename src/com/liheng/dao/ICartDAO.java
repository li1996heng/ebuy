package com.liheng.dao;

import java.util.List;

import com.liheng.entity.Cart;
import com.liheng.entity.User;

public interface ICartDAO extends IBaseDAO<Cart>{
	
	/**
	 * 根据用户ID查询购物车信息
	 * @param id
	 * @return
	 */
	List<Cart> getCartByUser(User user);
	
	/**
	 * 当结算购物车 即创建订单时  需要把购物车该条信息作清空操作
	 * @param id
	 */
	void setDeleteCart(Integer id);
}
