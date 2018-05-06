package com.art.pojo;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer uid;

    private Date birthday;

    private String sex;

    private String uname;

    private String uidentification;

    private String upassword;

    private String tel;

    private String qq;

    private String email;

    private String money;

    @Override
	public String toString() {
		return "User [uid=" + uid + ", birthday=" + birthday + ", sex=" + sex + ", uname=" + uname
				+ ", uidentification=" + uidentification + ", upassword=" + upassword + ", tel=" + tel + ", qq=" + qq
				+ ", email=" + email + ", money=" + money + "]";
	}

	public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getUidentification() {
        return uidentification;
    }

    public void setUidentification(String uidentification) {
        this.uidentification = uidentification == null ? null : uidentification.trim();
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword == null ? null : upassword.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money == null ? null : money.trim();
    }
}