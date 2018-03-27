package com.liheng.json;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class ObjectJsonValueProcessor implements JsonValueProcessor {
	
	//{"name":value,"id":value}
	
	StringBuffer jsonSB = new StringBuffer("{");
	
	String[] props;
	Class<?> clazz;
	
	public ObjectJsonValueProcessor(String[] props, Class<?> clazz) {
		super();
		this.props = props;
		this.clazz = clazz;
	}

	public Object processArrayValue(Object arg0, JsonConfig arg1) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object processObjectValue(String arg0, Object arg1, JsonConfig arg2) {
		// TODO Auto-generated method stub
		try {
			PropertyDescriptor pd = null;
			Method method = null;
			if(props != null) {
				for(int i=0;i<props.length;i++) {
					
					pd = new PropertyDescriptor(props[i], clazz);
					method = pd.getReadMethod();
					jsonSB.append("'"+props[i]+"':'"+method.invoke(arg1)+"'");
					if(i < props.length-1) {
						jsonSB.append(",");
					}
					
				}
				jsonSB.append("}");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return JSONObject.fromObject(jsonSB.toString());
	}

}
