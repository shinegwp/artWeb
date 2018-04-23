package com.art.pojo;

import java.io.Serializable;
import java.util.Date;

public class Refer implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private Date time;

    private Integer uid;

    private Integer iid;

    private String context;

    private String returnContext;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getIid() {
        return iid;
    }

    public void setIid(Integer iid) {
        this.iid = iid;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context == null ? null : context.trim();
    }

    public String getReturnContext() {
        return returnContext;
    }

    public void setReturnContext(String returnContext) {
        this.returnContext = returnContext == null ? null : returnContext.trim();
    }
}