package com.liheng.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 购物车实体类
 * @author 李恒
 *
 */
@Entity
@Table(name = "cart")
public class Cart {
	
	@Id
	@GeneratedValue(generator = "_native")
	@GenericGenerator(name = "_native", strategy = "native")
	private Integer id;		//购物车表主键
	
	@Column(name="isDelete",nullable=false,columnDefinition="INT default 1")
	private Integer isDelete;		//是否删除购物车  1：未删除   0：删除
	
	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;	//购物车创建时间
	
	@Column(name = "orderNum" ,length = 1000)
	private Integer orderNum;	//商品数量
	
	@Column(name = "price")
	private float price;		//商品价格
	
	@ManyToOne // 外键
	@JoinColumn(name = "userID")
	private User user;			//购物车创建人信息
	

	@ManyToOne // 外键
	@JoinColumn(name = "productID")
	private Product product;	//商品信息


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getIsDelete() {
		return isDelete;
	}


	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}


	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public Integer getOrderNum() {
		return orderNum;
	}


	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}


	public float getPrice() {
		return price;
	}


	public void setPrice(float price) {
		this.price = price;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}


	@Override
	public String toString() {
		return "Order [Id=" + id + ", isDelete=" + isDelete + ", createTime=" + createTime + ", orderNum=" + orderNum
				+ ", price=" + price + ", user=" + user + ", product=" + product + "]";
	}
	
}
