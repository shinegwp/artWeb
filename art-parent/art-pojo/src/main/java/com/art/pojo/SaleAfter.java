package com.art.pojo;

import java.io.Serializable;

public class SaleAfter implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String formid;

    private String title;

    private String onemoney;

    private String summoney;

    private String descripte;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFormid() {
        return formid;
    }

    public void setFormid(String formid) {
        this.formid = formid == null ? null : formid.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getOnemoney() {
        return onemoney;
    }

    public void setOnemoney(String onemoney) {
        this.onemoney = onemoney == null ? null : onemoney.trim();
    }

    public String getSummoney() {
        return summoney;
    }

    public void setSummoney(String summoney) {
        this.summoney = summoney == null ? null : summoney.trim();
    }

    public String getDescripte() {
        return descripte;
    }

    public void setDescripte(String descripte) {
        this.descripte = descripte == null ? null : descripte.trim();
    }
}