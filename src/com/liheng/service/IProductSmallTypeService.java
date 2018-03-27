package com.liheng.service;

import java.util.List;

import com.liheng.entity.ProductSmallType;

public interface IProductSmallTypeService {
	List<ProductSmallType> findProductSmallTypeByBigTypeID(Integer id);
}
