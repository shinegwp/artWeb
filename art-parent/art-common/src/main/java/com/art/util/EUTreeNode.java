package com.art.util;

import java.io.Serializable;

/**
 * easyUI树形控件节点格式
 * <p>Title: EUTreeNode</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	入云�?
 * @date	2015�?9�?4日上�?9:13:14
 * @version 1.0
 */
public class EUTreeNode implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long id;
	private String text;
	private String state;
	
	public EUTreeNode() {
		super();
	}
	public EUTreeNode(long id, String text, String state) {
		super();
		this.id = id;
		this.text = text;
		this.state = state;
	}
	@Override
	public String toString() {
		return "EUTreeNode [id=" + id + ", text=" + text + ", state=" + state + "]";
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
