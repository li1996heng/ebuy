package com.liheng.dao;

import java.util.List;

import com.liheng.entity.Product;

public interface IProductDAO extends IBaseDAO<Product>{

	/**
	 * 根据某一参数查询产品表
	 * @param hql
	 * @param listParam
	 * @return
	 */
	List<Product> getProductByParam(String hql,List<Object> listParam);
	
	/**
	 * 后台界面设置商品为热卖
	 * @param list
	 */
	void setProductHot(List<Integer> list);
}
