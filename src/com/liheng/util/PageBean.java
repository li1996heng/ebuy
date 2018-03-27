package com.liheng.util;

import java.util.List;

/**
 * 分页工具类
 * @author 李恒
 *
 * @param <T>
 */
public class PageBean<T> {
	// 每页数据条数默认值
	public final static int DEFAULT_PAGESIZE = 5;
	// 当前页页码的默认值
	public final static int DEFAULT_PAGENO = 1;
	// 当前页页码
	private Integer currentPage = DEFAULT_PAGENO;
	// 每页显示的数据条数
	private Integer pageSize = DEFAULT_PAGESIZE;
	// 总的记录数（从数据库查出来再传入的）
	private Integer totalCount;
	// 总页数
	private Integer totalPage;
	// 当前页数据的集合
	private List<T> data;
	// 上一页
	private Integer prePage;
	// 下一页
	private Integer nextPage;
   //末页
	private Integer lastPage;
	//带参构造方法
	public PageBean(Integer pageSize, Integer totalCount) {
		super();
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.totalPage = this.totalCount % this.pageSize == 0 ? this.totalCount / this.pageSize
				: this.totalCount / this.pageSize + 1;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public Integer getTotalPage() {
		return totalPage;
	}
   //返回上一页的页码
	public Integer getPrePage() {
		 if(currentPage>1){
			 return currentPage-1;
		 }
		 return 1;
	//	return currentPage>1?currentPage-1:1;
	}
	 //返回下一页的页码
	public Integer getNextPage() {
		return currentPage<totalPage?currentPage+1:totalPage;
	}
    //返回最后一页的页码
	public Integer getLastPage() {
		return totalPage;
	}

	@Override
	public String toString() {
		return "PageBean [currentPage=" + currentPage + ", pageSize=" + pageSize + ", totalCount=" + totalCount
				+ ", totalPage=" + totalPage + ", data=" + data + ", prePage=" + prePage + ", nextPage=" + nextPage
				+ ", lastPage=" + lastPage + "]";
	}
	
}