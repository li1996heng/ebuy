package com.liheng.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.liheng.dao.IProductSmallTypeDAO;
import com.liheng.entity.ProductSmallType;

@Repository
public class ProductSmallTypeDAOImpl extends BaseDAOImpl<ProductSmallType> implements IProductSmallTypeDAO{

	public List<ProductSmallType> findProductSmallTypeByBigTypeID(Integer id) {
		String hql = "from ProductSmallType p where p.bigType.ID = "+id;
		List<ProductSmallType> find = (List<ProductSmallType>) getHibernateTemplate().find(hql);
		if(find.size() > 0) {
			return find;
		}
		return null;
	}

}
