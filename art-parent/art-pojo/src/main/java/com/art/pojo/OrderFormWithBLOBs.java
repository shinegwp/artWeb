package com.art.pojo;

import java.io.Serializable;

public class OrderFormWithBLOBs extends OrderForm implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String formNum;

    private String address;

    public String getFormNum() {
        return formNum;
    }

    public void setFormNum(String formNum) {
        this.formNum = formNum == null ? null : formNum.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }
}