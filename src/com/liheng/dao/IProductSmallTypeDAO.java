package com.liheng.dao;

import java.util.List;

import com.liheng.entity.ProductSmallType;

public interface IProductSmallTypeDAO extends IBaseDAO<ProductSmallType>{

	List<ProductSmallType> findProductSmallTypeByBigTypeID(Integer id);
	
}
