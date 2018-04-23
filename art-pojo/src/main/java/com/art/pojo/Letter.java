package com.art.pojo;

import java.io.Serializable;
import java.util.Date;

public class Letter implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String uemail;

    private String pemail;

    private String title;

    private Date time;

    private String utop;

    private String contextAddress;

    @Override
	public String toString() {
		return "Letter [id=" + id + ", uemail=" + uemail + ", pemail=" + pemail + ", title=" + title + ", time=" + time
				+ ", utop=" + utop + ", contextAddress=" + contextAddress + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail == null ? null : uemail.trim();
    }

    public String getPemail() {
        return pemail;
    }

    public void setPemail(String pemail) {
        this.pemail = pemail == null ? null : pemail.trim();
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

    public String getUtop() {
        return utop;
    }

    public void setUtop(String utop) {
        this.utop = utop == null ? null : utop.trim();
    }

    public String getContextAddress() {
        return contextAddress;
    }

    public void setContextAddress(String contextAddress) {
        this.contextAddress = contextAddress == null ? null : contextAddress.trim();
    }
}