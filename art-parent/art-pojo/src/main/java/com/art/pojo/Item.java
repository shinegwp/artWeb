package com.art.pojo;

import java.io.Serializable;
import java.util.Date;

public class Item implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String title;

    private Integer status;

    private Integer cid;

    private String pname;

    private String salesVolume;

    private Long price;

    private Date created;

    private Date updated;

    private Integer ownerId;

    private String imgAddress;

    private String description;

    private String fistShow;

    private Integer likeCount;

    @Override
	public String toString() {
		return "Item [id=" + id + ", title=" + title + ", status=" + status + ", cid=" + cid + ", pname=" + pname
				+ ", salesVolume=" + salesVolume + ", price=" + price + ", created=" + created + ", updated=" + updated
				+ ", ownerId=" + ownerId + ", imgAddress=" + imgAddress + ", description=" + description + ", fistShow="
				+ fistShow + ", likeCount=" + likeCount + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }

    public String getSalesVolume() {
        return salesVolume;
    }

    public void setSalesVolume(String salesVolume) {
        this.salesVolume = salesVolume == null ? null : salesVolume.trim();
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
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

    public Integer getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Integer ownerId) {
        this.ownerId = ownerId;
    }

    public String getImgAddress() {
        return imgAddress;
    }

    public void setImgAddress(String imgAddress) {
        this.imgAddress = imgAddress == null ? null : imgAddress.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getFistShow() {
        return fistShow;
    }

    public void setFistShow(String fistShow) {
        this.fistShow = fistShow == null ? null : fistShow.trim();
    }

    public Integer getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(Integer likeCount) {
        this.likeCount = likeCount;
    }
}