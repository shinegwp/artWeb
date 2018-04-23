package com.art.util;

import java.io.Serializable;
import java.util.List;

import com.art.pojo.Item;
import com.art.pojo.ItemImg1;
import com.art.pojo.ItemImg2;

public class Detail implements Serializable {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
List<ItemImg1> img1;
List<ItemImg2> img2;
Item item;

@Override
public String toString() {
	return "Detail [img1=" + img1 + ", img2=" + img2 + ", item=" + item + "]";
}

public Detail() {
	super();
}

public Detail(List<ItemImg1> img1, List<ItemImg2> img2, Item item) {
	super();
	this.img1 = img1;
	this.img2 = img2;
	this.item = item;
}

public List<ItemImg1> getImg1() {
	return img1;
}

public void setImg1(List<ItemImg1> img1) {
	this.img1 = img1;
}

public List<ItemImg2> getImg2() {
	return img2;
}

public void setImg2(List<ItemImg2> img2) {
	this.img2 = img2;
}

public Item getItem() {
	return item;
}

public void setItem(Item item) {
	this.item = item;
}



}
