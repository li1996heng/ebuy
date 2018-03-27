package com.liheng.aciton;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.liheng.entity.Product;
import com.liheng.entity.ProductBigType;
import com.liheng.service.IBigTypeService;
import com.liheng.service.IProductService;

@Component
public class InitListener  implements ServletContextListener{

	private static ApplicationContext ac;

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	public void contextInitialized(ServletContextEvent arg0) {
		ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		IBigTypeService bigTypeService = (IBigTypeService) ac.getBean("bigTypeServiceImpl");
		List<ProductBigType> data = bigTypeService.findAllBigType();
		ServletContext application = arg0.getServletContext();
		application.setAttribute("data", data);
		
		
		//加载热销商品
		IProductService productService = (IProductService) ac.getBean("productServiceImpl");
		Product product = new Product();
		product.setHot(1);
		List<Product> hotProductList = productService.getProductList(product);
		application.setAttribute("hotProductList", hotProductList);
		
		//加载特价商品数据
		product = new Product();
		product.setSpecialPrice(1);
		List<Product> specialProductList = productService.getProductList(product);
		application.setAttribute("specialProductList", specialProductList);
		for (Product product2 : specialProductList) {
			System.out.println(product2);
		}
	}

}
