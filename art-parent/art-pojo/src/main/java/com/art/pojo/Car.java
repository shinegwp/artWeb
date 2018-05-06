package com.art.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Car implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	List<Item> items = new ArrayList<Item>();
	
	public void addItem(Item item)
	{
		items.add(item);
	}
	 public List<Item> getItems() 
	 {
		 return items;
	 }
	 public void setItems(List<Item> list) 
	 {
		 this.items = list;
	 }
	@Override
	public String toString() {
		return "Car [items=" + items + "]";
	}
	 
//    private Integer id;
//
//    private Integer uid;
//
//    private Integer iid;
//
//    private String img;
//
//    private String title;
//
//    private Long price;
//
//    public Integer getId() {
//        return id;
//    }
//
//    public void setId(Integer id) {
//        this.id = id;
//    }
//
//    public Integer getUid() {
//        return uid;
//    }
//
//    public void setUid(Integer uid) {
//        this.uid = uid;
//    }
//
//    public Integer getIid() {
//        return iid;
//    }
//
//    public void setIid(Integer iid) {
//        this.iid = iid;
//    }
//
//    public String getImg() {
//        return img;
//    }
//
//    public void setImg(String img) {
//        this.img = img == null ? null : img.trim();
//    }
//
//    public String getTitle() {
//        return title;
//    }
//
//    public void setTitle(String title) {
//        this.title = title == null ? null : title.trim();
//    }
//
//    public Long getPrice() {
//        return price;
//    }
//
//    public void setPrice(Long price) {
//        this.price = price;
//    }
}