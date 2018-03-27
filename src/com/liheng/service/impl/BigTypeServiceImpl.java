package com.liheng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liheng.dao.IBigTypeDAO;
import com.liheng.entity.ProductBigType;
import com.liheng.service.IBigTypeService;

@Service
public class BigTypeServiceImpl implements IBigTypeService{

	@Autowired
	private IBigTypeDAO bigTypeDAO;
	
	public List<ProductBigType> findAllBigType() {
		// TODO Auto-generated method stub
		return bigTypeDAO.findAll();
	}

	public ProductBigType findBigTypeById(Integer Id) {
		// TODO Auto-generated method stub
		return bigTypeDAO.findById(Id);
	}
	
	

}
