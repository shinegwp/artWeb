package com.art.pojo;

import java.io.Serializable;
import java.util.Date;

public class Professor implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer pid;

    private String pname;

    private String skill;

    private Date birthday;

    private String university;

    private String broLocation;

    private String nowLocation;

    private Date created;

    private Date updated;

    private String img;

    private String email;

    private String tel;

    private String password;

    private String experience;

    @Override
	public String toString() {
		return "Professor [pid=" + pid + ", pname=" + pname + ", skill=" + skill + ", birthday=" + birthday
				+ ", university=" + university + ", broLocation=" + broLocation + ", nowLocation=" + nowLocation
				+ ", created=" + created + ", updated=" + updated + ", img=" + img + ", email=" + email + ", tel=" + tel
				+ ", password=" + password + ", experience=" + experience + "]";
	}

	public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill == null ? null : skill.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university == null ? null : university.trim();
    }

    public String getBroLocation() {
        return broLocation;
    }

    public void setBroLocation(String broLocation) {
        this.broLocation = broLocation == null ? null : broLocation.trim();
    }

    public String getNowLocation() {
        return nowLocation;
    }

    public void setNowLocation(String nowLocation) {
        this.nowLocation = nowLocation == null ? null : nowLocation.trim();
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience == null ? null : experience.trim();
    }
}