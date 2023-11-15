package cn.util;

import java.io.Serializable;

public class PageBean implements Serializable{
	private int pageNo;
	private int pageSize;
	private int totalCount;
	private int nextPage;
	private int prevPage;
	private int totalPage;
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getNextPage() {
		if(getPageNo()<getTotalPage()){
			return getPageNo()+1;
	}else{
		return getTotalPage();
	}
	}
	
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getPrevPage() {
		if(getPageNo()>1){
			return getPageNo()-1;
		}else{
			return 1;
		}
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getTotalPage() {
		if(getTotalCount()%getPageSize()==0){
			return getTotalCount()/getPageSize();
		}else{
			return getTotalCount()/getPageSize()+1;
		}
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	
}
