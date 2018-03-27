package com.liheng.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liheng.dao.IProductDAO;
import com.liheng.entity.Product;
import com.liheng.service.IProductService;
import com.liheng.util.PageBean;

@Service
public class ProductServiceImpl implements IProductService {
	@Autowired
	private IProductDAO productDAO;

	public List<Product> getProductList(Product product) {

		// 定义查询语句
		StringBuffer sb = new StringBuffer("from Product where 1 = 1");
		// 定义查询参数列表
		List<Object> listParam = new ArrayList<Object>();
		// 如果查询参数不为空，则进入第20行
		if (product != null) {

			// 如果查询的是热销商品
			if (product.getHot() == 1) {
				// 添加查询热销商品的hql语句
				sb.append(" and hot = ?");
				// 并把参数添加到listParam参数集合中··
				listParam.add(product.getHot());
			}

			// 如果查询的是特价商品
			if (product.getSpecialPrice() == 1) {
				sb.append(" and specialPrice = ?");
				listParam.add(product.getSpecialPrice());
			}

			// 根据名称模糊查询
			if (product.getName() != null && product.getName().trim().length() > 0) {
				sb.append(" and name like ?");
				listParam.add("%" + product.getName() + "%");
			}

			// 根据大类查询
			if (product.getBigType() != null) {
				sb.append(" and bigType.ID = ?");
				listParam.add(product.getBigType().getID());
			}

			// 根据小类查询
			if (product.getSmallType() != null) {
				sb.append(" and smallType.ID = ?");
				listParam.add(product.getSmallType().getID());
			}

		}
		// TODO Auto-generated method stub
		return productDAO.getProductByParam(sb.toString(), listParam);
	}

	public PageBean<Product> getProductListByPageBean(Product product, Integer currentPage, Integer pageSize) {
		// 定义查询语句
		StringBuffer sb = new StringBuffer("from Product where 1 = 1");
		// 定义查询参数列表
		List<Object> listParam = new ArrayList<Object>();
		// 如果查询参数不为空，则进入第20行
		if (product != null) {

			// 根据名称模糊查询
			if (product.getName() != null && product.getName().trim().length() > 0) {
				sb.append(" and name like "+product.getName());
				listParam.add("%" + product.getName() + "%");
			}

			// 根据大类查询
			if (product.getBigType() != null) {
				sb.append(" and bigType.ID = "+product.getBigType().getID());
				listParam.add(product.getBigType().getID());
			}

			// 根据小类查询
			if (product.getSmallType() != null) {
				sb.append(" and smallType.ID = "+product.getSmallType().getID());
				listParam.add(product.getSmallType().getID());
			}

		}
		
		return productDAO.pageQuery(sb.toString(), pageSize, currentPage, null);
	}

	public void saveProduct(Product product) {
		// TODO Auto-generated method stub
		productDAO.save(product);
	}

	public void setProductHot(List<Integer> list) {
		// TODO Auto-generated method stub
		productDAO.setProductHot(list);
	}

	public Product getProductByID(Integer id) {
		// TODO Auto-generated method stub
		return productDAO.findById(id);
	}

	
}
