package com.liheng.aciton;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.liheng.entity.ProductBigType;
import com.liheng.entity.ProductSmallType;
import com.liheng.service.IProductSmallTypeService;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
/**
 * 二级联动菜单  根据大类信息传入对应小类信息到后台商品添加信息界面
 * @author 李恒
 *
 */
@Controller
@Scope("prototype")
public class ProductSmallTypeAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	@Autowired
	private IProductSmallTypeService productSmallTypeService;
	
	private ProductBigType bigType;
	
	
	public ProductBigType getBigType() {
		return bigType;
	}

	public void setBigType(ProductBigType bigType) {
		this.bigType = bigType;
	}
	
	public String smallTypeCombobox() throws Exception {
		List<ProductSmallType> productSmallType = productSmallTypeService.findProductSmallTypeByBigTypeID(bigType.getID());
		JsonConfig config = new JsonConfig();
		config.setExcludes(new  String[]{"productList","bigType"});
		
		JSONArray jsonArr = JSONArray.fromObject(productSmallType,config);
		
		JSONArray json = new JSONArray();
		
		json.addAll(jsonArr);
		
		System.out.println(jsonArr.toString());
		
		PrintWriter writer = getResponse().getWriter();
		writer.write(jsonArr.toString());
		return NONE;
	}
	
}
