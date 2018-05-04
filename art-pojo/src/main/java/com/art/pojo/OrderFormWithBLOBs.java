package com.art.pojo;

import java.io.Serializable;

public class OrderFormWithBLOBs extends OrderForm  implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String formNum;

    private String addressDetail;

    public String getFormNum() {
        return formNum;
    }

    public void setFormNum(String formNum) {
        this.formNum = formNum == null ? null : formNum.trim();
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail == null ? null : addressDetail.trim();
    }
}