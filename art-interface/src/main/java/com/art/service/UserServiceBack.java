package com.art.service;

import com.art.pojo.User;
import com.art.util.EUDataGridResult;

public interface UserServiceBack {
	public EUDataGridResult getUserList(int page, int rows);
	public int deleteItemById(Integer id);
	public int update(User user);
	public int insert(User user);
	public boolean itemAddTest();
}
