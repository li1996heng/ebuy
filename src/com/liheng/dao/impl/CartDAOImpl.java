package com.liheng.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.liheng.dao.ICartDAO;
import com.liheng.entity.Cart;
import com.liheng.entity.User;

@Repository
public class CartDAOImpl extends BaseDAOImpl<Cart> implements ICartDAO{

	public List<Cart> getCartByUser(User user) {
		String hql = "from Cart c where c.user.ID = ? and c.isDelete = 1";
		List<Cart> find = (List<Cart>) getHibernateTemplate().find(hql, user.getID());
		if(find.size() > 0) {
			return find;
		}
		return null;
	}

	public void setDeleteCart(Integer id) {
		// TODO Auto-generated method stub
		String hql = "update Cart c  set c.isDelete = 0 where c.id = ?";
		Query query = getSession().createQuery(hql);
		query.setInteger(0, id);
		query.executeUpdate();
	}

}
