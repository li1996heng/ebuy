package com.liheng.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

/**
 * 商品小类
 * @author bojiangzhou
 *
 */
@Entity
@Table(name="smallType")
public class ProductSmallType implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(generator="_native")
	@GenericGenerator(name="_native", strategy="native")
	private int ID; //ID
	
	@Column(length=50)
	private String name; //小类名称
	
	private String remark; //备注
	
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="bigTypeID")
	private ProductBigType bigType; //小类所属大类，多对一
	
	@OneToMany(mappedBy="smallType")
	private List<Product> productList; //商品集合, 一对多
	
	
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

	

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public ProductBigType getBigType() {
		return bigType;
	}

	public void setBigType(ProductBigType bigType) {
		this.bigType = bigType;
	}
	
	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	
	
}
