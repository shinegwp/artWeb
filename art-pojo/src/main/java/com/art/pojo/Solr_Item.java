package com.art.pojo;

public class Solr_Item {
	
	private String id;
	private String title;
	private String pname;
	private Long price;
	private String img_address;
	private String description;
	public Solr_Item(){}
	public Solr_Item(String id, String title, String pname, Long price, String imgAddress, String description) {
		super();
		this.id = id;
		this.title = title;
		this.pname = pname;
		this.price = price;
		this.img_address = imgAddress;
		this.description = description;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public String getImgAddress() {
		return img_address;
	}
	public void setImgAddress(String imgAddress) {
		this.img_address = imgAddress;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}
