package com.liheng.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 商品实体
 *
 */
@Entity
@Table(name = "product")
public class Product implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator = "_native")
	@GenericGenerator(name = "_native", strategy = "native")
	private int ID; // ID

	@Column(length = 50)
	private String name; // 商品名称

	private float price; // 商品价格

	private int stock; // 库存

	@Column(name = "proPic")
	private String proPic; // 商品图片路径

	@Column(length = 1000)
	private String description; // 商品描述

	private int hot = 0; // 商品热卖[默认为0，不是热卖; 1是热卖商品]

	@JSONField(format = "yyyy-MM-dd HH:mm:ss")
	private Date hotTime; // 设置热卖的时间

	private int specialPrice; // 是否特价[默认0，不是特价商品；1是特价商品]

	private Date specialPriceTime; // 特价时间

	@ManyToOne // 外键
	@JoinColumn(name = "bigTypeID")
	private ProductBigType bigType; // 大类

	@ManyToOne // 外键
	@JoinColumn(name = "smallTypeID")
	private ProductSmallType smallType; // 小类

	@JSONField(name = "ID")
	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getProPic() {
		return proPic;
	}

	public void setProPic(String proPic) {
		this.proPic = proPic;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getHot() {
		return hot;
	}

	public void setHot(int hot) {
		this.hot = hot;
	}

	public Date getHotTime() {
		return hotTime;
	}

	public void setHotTime(Date hotTime) {
		this.hotTime = hotTime;
	}

	public int getSpecialPrice() {
		return specialPrice;
	}

	public void setSpecialPrice(int specialPrice) {
		this.specialPrice = specialPrice;
	}

	public Date getSpecialPriceTime() {
		return specialPriceTime;
	}

	public void setSpecialPriceTime(Date specialPriceTime) {
		this.specialPriceTime = specialPriceTime;
	}
	
	@JSONField(name = "bigType")
	public ProductBigType getBigType() {
		return bigType;
	}

	public void setBigType(ProductBigType bigType) {
		this.bigType = bigType;
	}

	@JSONField(name = "smallType")
	public ProductSmallType getSmallType() {
		return smallType;
	}

	public void setSmallType(ProductSmallType smallType) {
		this.smallType = smallType;
	}

	@Override
	public String toString() {
		return "Product [ID=" + ID + ", name=" + name + ", price=" + price + ", stock=" + stock + ", proPic=" + proPic
				+ ", description=" + description + ", hot=" + hot + ", hotTime=" + hotTime + ", specialPrice="
				+ specialPrice + ", specialPriceTime=" + specialPriceTime + ", bigType=" + bigType + ", smallType="
				+ smallType + "]";
	}

}
