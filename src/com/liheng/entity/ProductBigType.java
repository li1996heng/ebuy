package com.liheng.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 商品大类
 * @author Administrator
 *
 */

@Entity
@Table(name="bigtype")
public class ProductBigType {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer ID;
	
	@Column
	private String name;
	
	private String remark;
	
	@OneToMany(mappedBy="bigType")  
	@JSONField(serialize=false)
	private List<Product> productList = new ArrayList<Product>(); //商品集合
	
	@OneToMany(mappedBy="bigType", fetch=FetchType.EAGER) //设置'急加载'，加载大类的时候把小类也加载出来
	@JSONField(serialize=false)
	private List<ProductSmallType> smallTypeList = new ArrayList<ProductSmallType>(); //大类下小类集合

	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	public List<ProductSmallType> getSmallTypeList() {
		return smallTypeList;
	}

	public void setSmallTypeList(List<ProductSmallType> smallTypeList) {
		this.smallTypeList = smallTypeList;
	}

	@Override
	public String toString() {
		return "ProductBigType [ID=" + ID + ", name=" + name + ", remark=" + remark + "]";
	}
	
	
}
