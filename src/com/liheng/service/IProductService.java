package com.liheng.service;

import java.util.List;

import com.liheng.entity.Product;
import com.liheng.util.PageBean;

public interface IProductService {
	/**
	 * 根据不同的查询条件得到商品列表
	 * @param product
	 * @return
	 */
	List<Product> getProductList(Product product);
	
	/**
	 * 根据不同条件分页查询商品信息
	 * @param product
	 * @param currentPage
	 * @param pageSize
	 * @return
	 */
	PageBean<Product> getProductListByPageBean(Product product,Integer currentPage,Integer pageSize);
	
	/**
	 * 保存商品信息
	 * @param product
	 */
	void saveProduct(Product product);
	
	/**
	 * 后台界面设置商品为热卖
	 * @param list
	 */
	void setProductHot(List<Integer> list);
	
	/**
	 * 通过ID查询商品详情
	 * @param id
	 * @return
	 */
	Product getProductByID(Integer id);
}
