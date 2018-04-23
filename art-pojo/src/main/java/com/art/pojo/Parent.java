package com.art.pojo;

import java.io.Serializable;

public class Parent implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String pname;

    private String imgaddress;

    @Override
	public String toString() {
		return "Parent [id=" + id + ", pname=" + pname + ", imgaddress=" + imgaddress + "]";
	}

	public Parent() {
		super();
	}

	public Parent(Integer id, String pname, String imgaddress) {
		super();
		this.id = id;
		this.pname = pname;
		this.imgaddress = imgaddress;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    public String getImgaddress() {
        return imgaddress;
    }

    public void setImgaddress(String imgaddress) {
        this.imgaddress = imgaddress == null ? null : imgaddress.trim();
    }
}