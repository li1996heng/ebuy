package com.liheng.aciton;

import java.io.PrintWriter;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.liheng.entity.ProductBigType;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@Controller
@Scope("prototype")
public class ProductBigTypeAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	public String bigTypeCombobox() throws Exception{
 		List<ProductBigType> biList = (List<ProductBigType>)getApplication().getAttribute("data");
		
		JSONObject json = new JSONObject();
		json.put("ID", "");
		json.put("name", "请选择");
		json.put("remark", "");
		
		JSONArray jsonArr = new JSONArray();
		jsonArr.add(json);
		
		JsonConfig config = new JsonConfig();
		//设置需要过滤的属性
		config.setExcludes(new String[] {"productList","smallTypeList"});
		JSONArray jsonC = JSONArray.fromObject(biList, config);
		jsonArr.addAll(jsonC);
		
		System.out.println(jsonArr.toString());
		PrintWriter writer = getResponse().getWriter();
		writer.write(jsonArr.toString());
		
		
		return NONE;
	}
	
}
