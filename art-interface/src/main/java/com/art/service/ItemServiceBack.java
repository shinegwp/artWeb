package com.art.service;

import java.util.List;

import com.art.pojo.Item;
import com.art.util.EUDataGridResult;

public interface ItemServiceBack {
	public int ReshelfItem(Integer id);
	public int deleteItemById(Integer id);
	public int insertItem(Item item);
	public EUDataGridResult getItemList(int page, int rows);
	public Item getItemById(String id);
}
