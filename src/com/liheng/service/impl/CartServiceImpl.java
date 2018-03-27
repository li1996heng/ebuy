package com.liheng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liheng.dao.ICartDAO;
import com.liheng.entity.Cart;
import com.liheng.entity.User;
import com.liheng.service.ICartService;

@Service
public class CartServiceImpl implements ICartService{

	@Autowired
	private ICartDAO cartDAO;
	public void save(Cart order) {
		// TODO Auto-generated method stub
		cartDAO.save(order);
	}
	
	public List<Cart> getCartByUser(User user) {
		// TODO Auto-generated method stub
		return cartDAO.getCartByUser(user);
	}

	public Cart getCartById(Integer id) {
		// TODO Auto-generated method stub
		return cartDAO.findById(id);
	}

	public void setDeleteCart(Integer id) {
		// TODO Auto-generated method stub
		cartDAO.setDeleteCart(id);
	}

}
