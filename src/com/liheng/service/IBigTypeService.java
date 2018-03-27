package com.liheng.service;

import java.util.List;

import com.liheng.entity.ProductBigType;

public interface IBigTypeService {
	/**
	 * 得到商品大类的信息
	 * @return
	 */
	List<ProductBigType> findAllBigType();
	
	/**
	 * 根据ID获取大类信息
	 * @param Id
	 * @return
	 */
	ProductBigType findBigTypeById(Integer Id);
}
