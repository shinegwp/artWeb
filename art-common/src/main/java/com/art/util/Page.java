package com.art.util;

import java.io.Serializable;

public class Page implements Serializable  {
	private static final long serialVersionUID = -3198048449643774660L;  
	  
	    private int pageNow = 1; // ��ǰҳ��  
	  
	    private int pageSize = 4; // ÿҳ��ʾ��¼������  
	  
	    private int totalCount; // �ܵļ�¼����  
	  
	    private int totalPageCount; // �ܵ�ҳ��  
	  
	    @SuppressWarnings("unused")  
	    private int startPos; // ��ʼλ�ã���0��ʼ  
	  
    @SuppressWarnings("unused")  
    private boolean hasFirst;// �Ƿ�����ҳ  
  
	    @SuppressWarnings("unused")  
    private boolean hasPre;// �Ƿ���ǰһҳ  
		
	    @SuppressWarnings("unused")  
	    private boolean hasNext;// �Ƿ�����һҳ  
	  
	    @SuppressWarnings("unused")  
    private boolean hasLast;// �Ƿ������һҳ  
	 
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
