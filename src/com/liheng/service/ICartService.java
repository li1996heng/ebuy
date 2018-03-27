package com.liheng.service;

import java.util.List;

import com.liheng.entity.Cart;
import com.liheng.entity.User;

public interface ICartService {
	/**
	 * 添加购物车
	 * @param order
	 */
	void save(Cart order);
	
	
	/**
	 * 根据用户信息查询购物车信息
	 * @param user
	 * @return
	 */
	List<Cart> getCartByUser(User user);

	/**
	 * 根据Id查询购物车信息
	 * @param id
	 * @return
	 */
	Cart getCartById(Integer id);
	
	/**
	 * 当结算购物车 即创建订单时  需要把购物车该条信息作清空操作
	 * @param id
	 */
	void setDeleteCart(Integer id);
}
