package com.art.service;

import com.art.pojo.Collection;
import com.art.util.EUDataGridResult;

public interface CollectionService {

	EUDataGridResult getControllerByUidAndPage(Integer uid, Integer page, Integer rows);

	Collection getCollectionByIid(Integer id);//�����ղ���Ʒ��id��ѯ��Ʒ

	int insert(Collection collection);

}
