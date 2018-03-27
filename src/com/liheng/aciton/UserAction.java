package com.liheng.aciton;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSONObject;
import com.liheng.entity.User;
import com.liheng.service.IUserService;
import com.liheng.util.PageBean;



@Controller
@Scope("prototype")
public class UserAction extends BaseAction {
	private static final long serialVersionUID = 1L;
	@Autowired
	private IUserService userService;

	private User user;
	
	//userManage.jsp传过来的批量删除ID
	private String ID;


	// 接收验证码
	private String imageCode;

	//用户信息管理界面传过来的 
	private Integer page = 1;
	private Integer rows = 10;
	
	
	
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getImageCode() {
		return imageCode;
	}

	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String toLogin() throws Exception {
		return "toLogin";
	}

	/**
	 * 普通用户登录
	 * 
	 * @return
	 * @throws Exception
	 */
	public String login() throws Exception {
		if (imageCode.equals(getSession().getAttribute("sRand"))) {
			if (userService.login(user) != null) {
				getSession().setAttribute("currentUser", userService.login(user));
				getRequest().setAttribute("errorMsg", "");
				return "loginsuccess";
			} else {
				getRequest().setAttribute("errorMsg", "用户名或密码输入错误");
				return LOGIN;
			}
		} else {
			getRequest().setAttribute("errorMsg", "请输入正确的验证码");
			return LOGIN;
		}
	}

	public String toRegister() throws Exception {
		return "toRegister";
	}

	/**
	 * 普通用户注册
	 * 
	 * @return
	 * @throws Exception
	 */
	public String register() throws Exception {
		System.out.println(user);
		userService.register(user);
		return "register";
	}

	/**
	 * 普通用户注销
	 * 
	 * @return
	 * @throws Exception
	 */
	public String logOut() throws Exception {
		// 使session无效，并解除绑定到它的任何对象
		getSession().invalidate();
		return "logOut";
	}

	/**
	 * 判断用户名是否存在
	 * 
	 * @return
	 * @throws Exception
	 */
	public String checkUserExist() throws Exception {
		String account = getRequest().getParameter("account");
		System.out.println(account);
		// 判断用户名是否存在
		boolean flag = userService.checkUserExist(account);
		// 实例化JSON对象
		JSONObject json = new JSONObject();
		if (flag) {
			// 如果用户名存在，result值为true
			json.put("result", true);
		} else {
			// 如果用户名不存在，result值为false
			json.put("result", false);
		}
		// json数据传个客户端
		PrintWriter writer = getResponse().getWriter();
		writer.print(json.toString());
		return NONE;
	}

	/**
	 * 处理管理员登录的方法
	 * 
	 * @return
	 * @throws Exception
	 */
	public String adminLogin() throws Exception {
		if (imageCode.equals(getSession().getAttribute("sRand"))) {
			if (userService.adminLogin(user) != null) {
				getRequest().setAttribute("currentUser", userService.adminLogin(user));
				return "adminLogin";
			} else {
				return "adminLoginFail";
			}
		} else {
			getRequest().setAttribute("errorMsg", "请输入正确的验证码");
			return "adminLoginFail";
		}
	}

	/**
	 * 跳转到用户信息页面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String toUserManage() throws Exception {

		return "toUserManage";
	}

	public String getUserList() throws Exception {
		// 获取前台页数
		//currentPage = Integer.parseInt(getRequest().getParameter("page"));
		// 获取前台每页显示条数
		//rows = Integer.parseInt(getRequest().getParameter("rows"));
		System.out.println(page);
		System.out.println(rows);
		PageBean<User> pageBean = userService.getAllUserByPage(page, rows);
		/*
		 * JsonConfig config = new JsonConfig();
		 * config.registerJsonValueProcessor(Date.class, new JsonValueProcessor() {
		 * 
		 * SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		 * 
		 * public Object processObjectValue(String arg0, Object arg1, JsonConfig arg2) {
		 * // TODO Auto-generated method stub if(arg1 instanceof Date) { return
		 * format.format(arg1).toString(); } return null; }
		 * 
		 * public Object processArrayValue(Object arg0, JsonConfig arg1) { // TODO
		 * Auto-generated method stub
		 * 
		 * return null; }
		 * 
		 * });
		 * 
		 * JSONArray jsonArr = JSONArray.fromObject(pageBean.getData(), config);
		 * JSONObject json = new JSONObject();
		 * 
		 * json.put("rows", jsonArr); json.put("total", pageBean.getTotalPage());
		 */

		// 设置响应对象的编码格式 ，避免出现中文乱码
		HttpServletResponse response = getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");

		PrintWriter writer = response.getWriter();

		// 使用谷歌JSON库封装JSon对象 自动转换日期格式
		// 但是日期格式月份是英文
		// Gson json = new Gson();
		// String json2 = json.toJson(pageBean.getData());

		/*
		 * 网上关于修改fastJson日期格式的四种方法
		 * 
		 * 推荐使用第一种 因为本例测试只有第一种方式设置有效 
		 * 而且第一种的日期格式可以实现自定义，
		 * 因为有的地方可能 只需要年月日属性 并且国外的时间格式是 日月年
		 * 
		 * 1.实体类Date属性给注解
		 * 
		 * @JSONField (format="yyyy-MM-dd HH:mm:ss") private Date birthday;//出生日期 
		 * 
		 * 2.
		 * SerializeConfig mapping = new SerializeConfig(); mapping.put(Date.class, new
		 * SimpleDateFormatSerializer("yyyy-MM-dd HH:mm:ss"));
		 * 
		 * 3.设置fastjson全局日期格式 JSONObject.DEFFAULT_DATE_FORMAT="yyyy-MM-dd";
		 * JSON.DEFFAULT_DATE_FORMAT = "yyyy-MM-dd";
		 * 
		 * 4. JSON.toJSONString(pageBean.getData(),
		 * SerializerFeature.DisableCircularReferenceDetect,
		 * SerializerFeature.WriteDateUseDateFormat);
		 */
		
		JSONObject json = new JSONObject();
		
		json.put("total", pageBean.getTotalCount());
		json.put("rows", pageBean.getData());

		String jsonString = json.toJSONString();
		System.out.println(jsonString);
		
		writer.write(jsonString);
		writer.flush();
		writer.close();
		return NONE;
	}
	
	/**
	 * 删除单条或多条用户信息
	 * @return
	 * @throws Exception
	 */
	public String deleteUser() throws Exception{
		JSONObject json = new JSONObject();
		json.put("result", true);
		
		String[] ids = ID.split(",");
		List<Integer> listId = new ArrayList<Integer>();
		for (int i = 0; i < ids.length; i++) {
			listId.add(Integer.valueOf(ids[i]));
		}
		
		System.out.println(json.toString());
		userService.deleteUser(listId);
		PrintWriter writer = getResponse().getWriter();
		writer.write(json.toString());
		return NONE;
	}
	
	/**
	 * 修改用户信息
	 * @return
	 * @throws Exception
	 */
	public String editUser() throws Exception{
		//判断用户是否修改成功的标示量
		boolean flag = false;
		//用于显示是否修改成功的提示信息
		String msg = "";
		
		JSONObject json = new JSONObject();
		//修改用户信息前需要判断前台页面传过来的ID是否为空 
		if(ID != null && !"".equals(ID) && ID.trim().length() > 0) {
			
			user.setID(Integer.valueOf(ID));
			user.setIsDelete(1);
			user.setStatus(1);
			userService.updateUser(user);
			flag = true;
			msg = "修改成功！";
			
		}else {
			flag = false;
			msg = "修改失败！";
		}
		json.put("result", flag);
		json.put("msg", msg);
		PrintWriter writer = getResponse().getWriter();
		writer.write(json.toJSONString());
		return NONE;
	}
}
