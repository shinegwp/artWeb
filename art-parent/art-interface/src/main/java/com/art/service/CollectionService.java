package com.art.service;

import com.art.pojo.Collection;
import com.art.util.EUDataGridResult;

public interface CollectionService {

	EUDataGridResult getControllerByUidAndPage(Integer uid, Integer page, Integer rows);

	Collection getCollectionByIid(Integer id);//根据收藏商品的id查询商品

	int insert(Collection collection);

}
