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

@Entity
@Table(name = "order_tab")
//注意 Order为数据库关键字  不能作为表名
public class Order {

	@Id
	@GeneratedValue(generator = "_native")
	@GenericGenerator(name = "_native", strategy = "native")
	private Integer id;		//订单表主键
	
	
	private Integer sellerId = 9527;	//卖家ID
	
	private Date createTime;	//订单创建时间
	
	@Column(name="isDelete",nullable=false,columnDefinition="INT default 1")
	private Integer isDelete = 1;	//是否取消订单  1：未删除   0：删除
	
	
	@ManyToOne // 外键
	@JoinColumn(name = "cartID")
	private Cart cart;		//引用购物车表信息   里面包括买家信息  商品信息  


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getSellerId() {
		return sellerId;
	}


	public void setSellerId(Integer sellerId) {
		this.sellerId = sellerId;
	}


	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public Integer getIsDelete() {
		return isDelete;
	}


	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}


	public Cart getCart() {
		return cart;
	}


	public void setCart(Cart cart) {
		this.cart = cart;
	}


	@Override
	public String toString() {
		return "Order [id=" + id + ", sellerId=" + sellerId + ", createTime=" + createTime + ", isDelete=" + isDelete
				+ ", cart=" + cart + "]";
	}
	
}
