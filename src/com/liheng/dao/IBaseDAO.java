package com.liheng.dao;

import java.io.Serializable;
import java.util.List;

import com.liheng.util.PageBean;



public interface IBaseDAO<T> {
	/**
	 * 数据增加
	 * @param entity
	 */
	public void save(T entity);
	
	/**
	 * 数据删除
	 * @param id
	 */
	public void delete(Serializable id);
	
	/**
	 * 数据更新
	 * @param entity
	 */
	public void update(T entity);
	
	/**
	 * 根据HQL语句更新或删除
	 * @param hql    更新或删除的hql语句
	 * @param obj	 占位符?的替换值
	 * @return
	 */
	public boolean updateByHql(String hql,Object [] obj);
	
	/**
	 * 查询所有数据
	 * @return
	 */
	public List<T> findAll();
	
	/**
	 * 根据ID查找单条数据
	 * @param id
	 * @return
	 */
	public T findById(Serializable id);
	
	/**
	 * 分页查询
	 * @param hql   查询的HQL语句
	 * @param pageSize	每页显示的记录数
	 * @param currentPage	当前页码
	 * @param values	占位符（？）需被替换的值
	 * @return	返回需分页的PageBen对象
	 */
	 public PageBean<T>  pageQuery(String hql, int pageSize, int currentPage,List<Object> listParam);
	    
	    /**
	     * 查询总记录数
	     * @param hql
	     * @return 返回查询总记录数
	     */
	 public Integer getTotalCount(String hql); 
}
