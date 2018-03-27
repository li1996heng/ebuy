package com.liheng.aciton;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * @author 李恒
 *
 */
public class BaseAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	/**
	 * 得到request对象
	 * @return
	 */
	public HttpServletRequest getRequest(){
		return ServletActionContext.getRequest();
	}
	
	/**
	 * 得到response对象
	 * @return
	 */
	public HttpServletResponse getResponse(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		return response;
	}
	
	/**
	 * 得到Session对象
	 * @return
	 */
	public HttpSession getSession(){
		return getRequest().getSession();
	}
	
	/**
	 * 得到application对象
	 * @return
	 */
	public ServletContext getApplication() {
		return getSession().getServletContext();
	}
	
}
