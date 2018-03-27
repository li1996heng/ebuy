package com.liheng.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.liheng.dao.IProductDAO;
import com.liheng.entity.Product;

@Repository
public class ProductDAOImple extends BaseDAOImpl<Product> implements IProductDAO {

	public List<Product> getProductByParam(String hql, List<Object> listParam) {
		// TODO Auto-generated method stub

		Query query = getSession().createQuery(hql);
		if (null != listParam && listParam.size() > 0) {
			for (int i = 0; i < listParam.size(); i++) {
				query.setParameter(i, listParam.get(i));
			}
		}
		return query.list();
	}

	public void setProductHot(List<Integer> list) {
		// 确定集合不为null且有值
		if (list.size() > 0 && list != null) {
			// 当list集合包含有多个数据 做批量设置为热卖操作
			if (list.size() > 1) {
				String hql = "update Product p set p.hot = 1 where p.ID in (:ids)";
				Query query = getSession().createQuery(hql);
				query.setParameterList("ids", list);
				query.executeUpdate();
			}
			// 当list集合中只有1个数据，做单条设置操作
			if (list.size() == 1) {
				String hql = "update Product p set p.hot = 1 where p.ID = " + list.get(0);
				getSession().createQuery(hql).executeUpdate();
			}
		}
	}

}
