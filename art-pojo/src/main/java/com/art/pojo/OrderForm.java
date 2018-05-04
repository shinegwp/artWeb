package com.art.pojo;

import java.io.Serializable;
import java.util.Date;

public class OrderForm implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private Long uid;

    private Date time;

    private long money;

    private long unitPrice;

    private String peopleName;

    private String state;

    private String tel;

    private String code;

    private String province;

    private String city;

    private String area;

    private long itemId;

    private Integer num;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long long1) {
        this.uid = long1;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public long getMoney() {
        return money;
    }

    public void setMoney(long total) {
        this.money = total ;
    }

    public long getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(long l) {
        this.unitPrice = l;
    }

    public String getPeopleName() {
        return peopleName;
    }

    public void setPeopleName(String peopleName) {
        this.peopleName = peopleName == null ? null : peopleName.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public long getItemId() {
        return itemId;
    }

    public void setItemId(long l) {
        this.itemId = l;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}