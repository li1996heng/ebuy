package com.liheng.aciton;

import java.io.File;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.DateTimeException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;
import org.aspectj.weaver.tools.ISupportsMessageContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializeFilter;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.liheng.entity.Cart;
import com.liheng.entity.Order;
import com.liheng.entity.Product;
import com.liheng.entity.ProductBigType;
import com.liheng.entity.ProductSmallType;
import com.liheng.entity.User;
import com.liheng.json.ObjectJsonValueProcessor;
import com.liheng.service.IBigTypeService;
import com.liheng.service.ICartService;
import com.liheng.service.IOrderService;
import com.liheng.service.IProductService;
import com.liheng.service.IUserService;
import com.liheng.util.PageBean;
import com.liheng.util.UUIDUtil;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Controller
@Scope("prototype")
public class ProductAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	@Autowired
	private IProductService productService;
	@Autowired
	private ICartService cartService;
	@Autowired
	private IUserService userService;
	@Autowired
	private IOrderService orderService;

	// 客户端传过来的搜索框的值
	private String searchName;

	private Product product;
	private User user;
	private Cart cart;
	private Order order;

	// 接收分页查询的大类参数
	private Integer bigTypeID;

	private Integer currentPage = 1;

	// 商品管理界面传过来的 当前页 和每页显示的记录数
	private Integer page = 1;
	private Integer rows = 10;

	// 接受上传图片参数
	private File proPic; // 上传文件
	private String proPicFileName; // 文件名称
	private String proPicContentType; // 文件类型

	// productManage.jsp传过来的修改热卖商品的ID
	private String ID;

	// productMain.jsp传过来去商品详情界面的ID
	private Integer id;

	// 订单数量
	private Integer select = 1;

	StringBuffer navCode = new StringBuffer();

	{
		navCode.append("您所在的位置 >首页 > ");
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public File getProPic() {
		return proPic;
	}

	public void setProPic(File proPic) {
		this.proPic = proPic;
	}

	public String getProPicFileName() {
		return proPicFileName;
	}

	public void setProPicFileName(String proPicFileName) {
		this.proPicFileName = proPicFileName;
	}

	public String getProPicContentType() {
		return proPicContentType;
	}

	public void setProPicContentType(String proPicContentType) {
		this.proPicContentType = proPicContentType;
	}

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

	public Integer getBigTypeID() {
		return bigTypeID;
	}

	public void setBigTypeID(Integer bigTypeID) {
		this.bigTypeID = bigTypeID;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getSelect() {
		return select;
	}

	public void setSelect(Integer select) {
		this.select = select;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	/**
	 * 根据大类分页查询商品信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String searchProduct() throws Exception {
		// 根据大类或者小类查询商品信息
		// List<Product> productList = productService.getProductList(product);
		/*
		 * if (bigTypeID != null) { ProductBigType bigType = new ProductBigType();
		 * bigType.setID(bigTypeID); product.setBigType(bigType); }
		 */
		PageBean<Product> pageBean = productService.getProductListByPageBean(product, currentPage, 8);
		navCode.append(pageBean.getData().get(0).getBigType().getName());
		getRequest().setAttribute("productList", pageBean);
		getRequest().setAttribute("navCode", navCode);
		return "list";
	}

	/**
	 * 根据小类分页查询商品信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String searchProductBySmallType() throws Exception {
		// 根据大类或者小类查询商品信息
		// List<Product> productList = productService.getProductList(product);
		/*
		 * if (bigTypeID != null) { ProductBigType bigType = new ProductBigType();
		 * bigType.setID(bigTypeID); product.setBigType(bigType); }
		 */
		PageBean<Product> pageBean = productService.getProductListByPageBean(product, currentPage, 8);
		navCode.append(pageBean.getData().get(0).getBigType().getName() + " > ");
		navCode.append(pageBean.getData().get(0).getSmallType().getName());
		getRequest().setAttribute("productList", pageBean);
		getRequest().setAttribute("navCode", navCode);
		return "searchProductBySmallType";
	}

	/**
	 * 根据搜索框内容模糊匹配商品信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String likeSearch() throws Exception {
		Product product = new Product();
		product.setName("'%" + searchName + "%'".trim());
		// List<Product> productList = productService.getProductList(product);
		PageBean<Product> pageBean = productService.getProductListByPageBean(product, currentPage, 8);
		if (pageBean.getData().size() > 0) {
			navCode.append(pageBean.getData().get(0).getBigType().getName() + " > ");
			navCode.append(pageBean.getData().get(0).getSmallType().getName());
		}
		getRequest().setAttribute("navCode", navCode);
		getRequest().setAttribute("productList", pageBean);
		// 把搜索框的值传入到前台 用于分页查询的条件
		getRequest().setAttribute("searchName", searchName);
		return "likeSearch";
	}

	/**
	 * 跳到商品信息展示界面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String toProduct() throws Exception {

		return "toProduct";
	}

	/**
	 * 得到商品信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String getProductList() throws Exception {

		PageBean<Product> productListByPageBean = productService.getProductListByPageBean(null, page, rows);
		/*
		 * Map<String, Object>map = new HashMap<String, Object>();
		 * map.put("rows",productListByPageBean.getData());
		 * map.put("total",productListByPageBean.getTotalCount()); String jsonString =
		 * JSON.toJSONString(map);
		 */

		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(ProductBigType.class,
				new ObjectJsonValueProcessor(new String[] { "ID", "name" }, ProductBigType.class));
		config.registerJsonValueProcessor(ProductSmallType.class,
				new ObjectJsonValueProcessor(new String[] { "ID", "name" }, ProductSmallType.class));

		JSONArray jsonArr = JSONArray.fromObject(productListByPageBean.getData(), config);
		JSONObject json = new JSONObject();

		json.put("rows", jsonArr);
		json.put("total", productListByPageBean.getTotalCount());
		PrintWriter writer = getResponse().getWriter();
		writer.write(json.toString());
		System.out.println(json.toString());

		return NONE;
	}

	/**
	 * 后台界面添加商品信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String saveProduct() throws Exception {
		// 判断商品是否增加成功的标示量
		boolean flag = false;
		System.out.println(product);

		String newFileName = proPicFileName.replace(proPicFileName.substring(0, proPicFileName.lastIndexOf(".")),
				UUIDUtil.getUUID() + String.valueOf(System.currentTimeMillis()));
		String path = ServletActionContext.getServletContext().getRealPath("/images/product");
		File file = new File(path + "/" + newFileName);
		FileUtil.copyFile(proPic, file);
		System.out.println(file.toString());
		if (product != null) {

			product.setHotTime(new Date(System.currentTimeMillis()));
			product.setProPic("images/product/" + newFileName);
			product.setSpecialPriceTime(new Date(System.currentTimeMillis()));
			productService.saveProduct(product);

			flag = true;
		}

		JSONObject json = new JSONObject();
		json.put("result", flag);

		PrintWriter writer = getResponse().getWriter();
		writer.write(json.toJSONString());

		return NONE;
	}

	/**
	 * 设置商品为热卖
	 * 
	 * @return
	 * @throws Exception
	 */
	public String setProductHot() throws Exception {
		JSONObject json = new JSONObject();
		json.put("result", true);

		String[] ids = ID.split(",");
		List<Integer> listId = new ArrayList<Integer>();
		for (int i = 0; i < ids.length; i++) {
			listId.add(Integer.valueOf(ids[i]));
		}
		productService.setProductHot(listId);
		PrintWriter writer = getResponse().getWriter();
		writer.write(json.toJSONString());
		return NONE;
	}

	/**
	 * 去商品详情界面
	 * 
	 * @return
	 * @throws Exception
	 */
	public String getProductDetail() throws Exception {
		product = productService.getProductByID(id);
		System.out.println(product);
		getRequest().setAttribute("product", product);
		return "getProductDetail";
	}

	/**
	 * 跳转到购物车界面之前 把商品信息和用户信息传过去
	 * 
	 * @return
	 * @throws Exception
	 */
	public String toCart() throws Exception {
		Product p = productService.getProductByID(product.getID());
		User u = userService.getUserByID(user.getID());
		System.out.println(user.getID());
		System.out.println(product.getID());
		Cart cart = new Cart();
		cart.setCreateTime(new Date(System.currentTimeMillis()));
		cart.setIsDelete(1);
		cart.setOrderNum(select);
		cart.setProduct(p);
		cart.setUser(u);
		cart.setPrice(select * (p.getPrice()));

		cartService.save(cart);

		getRequest().setAttribute("cart", cart);
		return "toCart";
	}

	/**
	 * 主页进入购物车的方法
	 * 
	 * @return
	 * @throws Exception
	 */
	public String gotoCart() throws Exception {
		User userByID = userService.getUserByID(cart.getUser().getID());
		List<Cart> cartByUser = cartService.getCartByUser(userByID);
		if(cartByUser != null) {
			getRequest().setAttribute("cartList", cartByUser);
		}
		return "gotoCart";
	}

	/**
	 * 创建订单
	 * 
	 * @return
	 * @throws Exception
	 */
	public String createOrder() throws Exception {
		Cart cartById = cartService.getCartById(cart.getId());

		Order order = new Order();
		order.setCart(cartById);
		order.setCreateTime(new Date(System.currentTimeMillis()));

		System.out.println(order);
		//结算购物车即创建订单信息   与此同时需把购物车该条订单清空 
		//这里只是把Cart表中的isDelete属性置为0
		orderService.saveOrder(order);
		cartService.setDeleteCart(cart.getId());

		return "createOrder";
	}

	public String lookOrder() throws Exception {
		List<Order> orderByUser = orderService.getOrderByUser(order.getCart().getUser());
		if(null != orderByUser) {
			getRequest().setAttribute("orderList", orderByUser);
		}
		return "lookOrder";
	}
}
