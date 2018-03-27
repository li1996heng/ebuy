package com.liheng.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 用户实体类
 * @author 李恒
 *
 */
@Entity
@Table(name="user")
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer ID;
	
	@Column(name="account",length=50)
	private String account;
	
	@Column(name="password",length=50)
	private String password;
	
	@Column(name="realName",length=50)
	private String name;
	
	@Column(name="sex",length=4)
	private String sex;
	
	@Column(name="birthday",length=15)
	@JSONField (format="yyyy-MM-dd HH:mm:ss")
	private Date birthday;//出生日期
	
	@Column(name="dentityCode",length=18)
	private String dentityCode;//身份证号
	
	@Column(name="email",length=20)
	private String email;
	
	@Column(name="mobile",length=11)
	private String mobile;
	
	@Column(name="address",length=200)
	private String address;//收货地址
	
	@Column(name="status",nullable=false,columnDefinition="INT default 1")
	private Integer status;//用户角色  1：普通用户 2：管理员用户
	
	@Column(name="isDelete",nullable=false,columnDefinition="INT default 1")
	private Integer isDelete;
	
	@JSONField(name = "ID")
	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getDentityCode() {
		return dentityCode;
	}

	public void setDentityCode(String dentityCode) {
		this.dentityCode = dentityCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	
	@Override
	public String toString() {
		return "User [ID=" + ID + ", account=" + account + ", password=" + password + ", name=" + name + ", sex=" + sex
				+ ", birthday=" + birthday + ", dentityCode=" + dentityCode + ", email=" + email + ", mobile=" + mobile
				+ ", address=" + address + "]";
	}

	
	
}