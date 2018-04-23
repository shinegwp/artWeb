package com.art.pojo;

import java.io.Serializable;
import java.util.Date;

public class ProLetter implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private Integer pid;

    private String reciver;

    private String title;

    private Date time;

    private String contextAddress;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getReciver() {
        return reciver;
    }

    public void setReciver(String reciver) {
        this.reciver = reciver == null ? null : reciver.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContextAddress() {
        return contextAddress;
    }

    public void setContextAddress(String contextAddress) {
        this.contextAddress = contextAddress == null ? null : contextAddress.trim();
    }
}