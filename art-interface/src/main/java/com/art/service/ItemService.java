package com.art.service;

import java.util.List;

import com.art.pojo.Item;
import com.art.util.EUDataGridResult;

public interface ItemService {
  public List<Item> getItems();
  public List<Item> getFirstShowItemsByPage(int pageno,String firstshow);
  public Integer getFirstShowItemsNumber(String firstshow);
  public Item getItemById(Integer id);
  public EUDataGridResult getItemByParentId(Integer parentId,Integer pageno, Integer i);
  public List<Item> getFirstShowItemsByFirstShow(String firstshow);
  public int insertItem(Item item);
  public EUDataGridResult getItemList(int page, int rows);
  public int InstockItem(Integer id);//上架

 
public List<Item> getnewItems();
public List<Item> getlikeCount();
public EUDataGridResult getSaleCountOrder(Integer page,Integer rows);
public Object getItemTimeOrder(Integer page,Integer rows);
public EUDataGridResult getItemBylikenumOrder(int parseInt, int parseInt2);
public EUDataGridResult getItemByParentIdOrderBySale(Integer parentId, Integer pageno, Integer i);
public EUDataGridResult getItemByParentIdOrderByCreated(Integer parentId, Integer pageno, Integer i);
public EUDataGridResult getItemByOwenId(Integer uid, Integer page, Integer rows);
  
}
