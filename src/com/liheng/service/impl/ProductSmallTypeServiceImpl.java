package com.liheng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liheng.dao.IProductSmallTypeDAO;
import com.liheng.entity.ProductBigType;
import com.liheng.entity.ProductSmallType;
import com.liheng.service.IProductSmallTypeService;

@Service
public class ProductSmallTypeServiceImpl implements IProductSmallTypeService{
	
	

	@Autowired
	private IProductSmallTypeDAO productSmallTypeDAO;

	public List<ProductSmallType> findProductSmallTypeByBigTypeID(Integer id) {
		// TODO Auto-generated method stub
		return productSmallTypeDAO.findProductSmallTypeByBigTypeID(id);
	}
	
	
}
