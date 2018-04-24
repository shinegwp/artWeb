package com.art.util;

import java.io.Serializable;

public class Page implements Serializable  {
	private static final long serialVersionUID = -3198048449643774660L;  
	  
	    private int pageNow = 1; // 当前页数  
	  
	    private int pageSize = 4; // 每页显示记录的条数  
	  
	    private int totalCount; // 总的记录条数  
	  
	    private int totalPageCount; // 总的页数  
	  
	    @SuppressWarnings("unused")  
	    private int startPos; // 开始位置，从0开始  
	  
    @SuppressWarnings("unused")  
    private boolean hasFirst;// 是否有首页  
  
	    @SuppressWarnings("unused")  
    private boolean hasPre;// 是否有前一页  
		
	    @SuppressWarnings("unused")  
	    private boolean hasNext;// 是否有下一页  
	  
	    @SuppressWarnings("unused")  
    private boolean hasLast;// 是否有最后一页  
	 
	    public Page(int totalCount, int pageNow) {  
	    	        this.totalCount = totalCount;  
	    	       this.pageNow = pageNow;  
	    	    }
	    public int getTotalPageCount() {  
	            totalPageCount = getTotalCount() / getPageSize();  
	    	        return (totalCount % pageSize == 0) ? totalPageCount  
	    	                : totalPageCount + 1;  
	    	    }  


    public int getPageNow() {
			return pageNow;
		}

		public void setPageNow(int pageNow) {
			this.pageNow = pageNow;
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

	
		public void setTotalPageCount(int totalPageCount) {
			this.totalPageCount = totalPageCount;
		}

		public int getStartPos() {
			return startPos;
		}

		public void setStartPos(int startPos) {
			this.startPos = startPos;
		}

		public boolean isHasFirst() {
			return hasFirst;
		}

		public void setHasFirst(boolean hasFirst) {
			this.hasFirst = hasFirst;
		}

		public boolean isHasPre() {
			return hasPre;
		}

		public void setHasPre(boolean hasPre) {
			this.hasPre = hasPre;
		}

		public boolean isHasNext() {
			return hasNext;
		}

		public void setHasNext(boolean hasNext) {
			this.hasNext = hasNext;
		}

		public boolean isHasLast() {
			return hasLast;
		}

		public void setHasLast(boolean hasLast) {
			this.hasLast = hasLast;
		}

		public static long getSerialversionuid() {
			return serialVersionUID;
		}


	      


}
