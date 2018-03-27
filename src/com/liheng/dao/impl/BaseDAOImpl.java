package com.liheng.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import com.liheng.dao.IBaseDAO;
import com.liheng.util.PageBean;


public class BaseDAOImpl<T> implements IBaseDAO<T>{

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	//实体类的字节码Class对象
	private Class<T> entityClass;
	public BaseDAOImpl(){
		//创建对象时自动调用无参数的构造方法,需要把T解析成子类传过来的实际的实体类型,比如Dept--需要用反射技术
		Type genType = getClass().getGenericSuperclass();
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		entityClass = (Class) params[0];
	}
	
	//得到HibernateTemplate
	public HibernateTemplate getHibernateTemplate(){
		return hibernateTemplate;
	}
	
	//得到session
	public Session getSession(){
		return hibernateTemplate.getSessionFactory().getCurrentSession();
	}
	
	public void save(T entity) {
		// TODO Auto-generated method stub
		Session session = this.getSession();
		session.save(entity);
	}

	public void delete(Serializable id) {
		// TODO Auto-generated method stub
		Session session = this.getSession();
		session.delete(this.findById(id));
	}

	public void update(T entity) {
		// TODO Auto-generated method stub
		Session session = this.getSession();
		session.update(entity);
	}

	public List<T> findAll() {
		// TODO Auto-generated method stub
		//定义查询HQL语句
		String hql = "from "+entityClass.getSimpleName();
		Session session = this.getSession();
		return session.createQuery(hql).list();
	}

	public T findById(Serializable id) {
		// TODO Auto-generated method stub
		Session session = this.getSession();
		T entity = (T) session.get(entityClass, id);
		return entity;
	}



	public boolean updateByHql(String hql, Object[] obj) {
		
		Session session = this.getSession();
		Query query = session.createQuery(hql);
		for (int i = 0; i < obj.length; i++) {
			query.setParameter(i, obj[i]);
		}
		
		int executeUpdate = query.executeUpdate();
		if (executeUpdate > 0) {
			return true;
		}
		return false;
	}

	public PageBean<T> pageQuery(String hql, int pageSize, int currentPage,List<Object> listParam) {
		// TODO Auto-generated method stub
		Session session = this.getSession();
		Query query = session.createQuery(hql);
		if (listParam != null && listParam.size() > 0) {
			for (int i = 0; i < listParam.size(); i++) {
				query.setParameter(i, listParam.get(i));
			}
		}
		//设置当前页的第一条记录的下标,假设pageSize:3 currentPage:1 ,第1页的记录的下标：0,1,2 第2页：3,4,5
		query.setFirstResult((currentPage - 1) * pageSize); 
		//设置当前页的总记录数，就是每页的数据条数
		query.setMaxResults(pageSize);
		List<T> data = query.list();
		Integer totalCount = this.getTotalCount(hql);
		PageBean<T> pageBean = new PageBean<T>(pageSize, totalCount);
		//设置当前页页码，是为了传到前台显示当前页的页码
		pageBean.setCurrentPage(currentPage);
		//设置当前页的数据集合，是为了在前台页面上显示数据
		pageBean.setData(data);
		return pageBean;
		
	}

	// 将传入的分页查询的hql转换为统计查询count(*)语句，并得到总条数
	public Integer getTotalCount(String hql) {
		// TODO Auto-generated method stub
		String countHql = "select count(*)  " + hql.substring(hql.indexOf("from"));
		Session session = this.getSession();
		Query query = session.createQuery(countHql);
		Long totalCount = (Long) query.uniqueResult();
		return Integer.valueOf(totalCount.toString());
	}
}
