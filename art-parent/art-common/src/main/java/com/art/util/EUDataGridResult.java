package com.art.util;

import java.io.Serializable;
import java.util.List;

import com.github.pagehelper.PageInfo;

public class EUDataGridResult implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long total;
	private List<?> rows;
	private PageInfo pageinfo;
	private List<String>  time;

	@Override
	public String toString() {
		return "EUDataGridResult [total=" + total + ", rows=" + rows + ", pageinfo=" + pageinfo + ", time=" + time
				+ "]";
	}
	public List<String> getTime() {
		return time;
	}
	public void setTime(List<String> time) {
		this.time = time;
	}
	public PageInfo getPageinfo() {
		return pageinfo;
	}
	public void setPageinfo(PageInfo pageinfo) {
		this.pageinfo = pageinfo;
	}
	public EUDataGridResult() {
		super();
	}
	public EUDataGridResult(long total, List<?> rows) {
		super();
		this.total = total;
		this.rows = rows;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public List<?> getRows() {
		return rows;
	}
	public void setRows(List<?> rows) {
		this.rows = rows;
	}
	
	
}
