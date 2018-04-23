package com.art.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.mapper.CollectionMapper;
import com.art.pojo.Collection;
import com.art.pojo.CollectionExample;
import com.art.pojo.CollectionExample.Criteria;
import com.art.service.CollectionService;
import com.art.util.EUDataGridResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class CollectionServiceImpl implements CollectionService {
@Autowired
CollectionMapper collectionmapper;

public EUDataGridResult getControllerByUidAndPage(Integer uid, Integer page, Integer rows) {
	CollectionExample example = new CollectionExample();
	Criteria criteria = example.createCriteria();
	criteria.andUidEqualTo(uid);
	PageHelper.startPage(page, rows); 
	List<Collection> clist = collectionmapper.selectByExample(example);
	 PageInfo<Collection> p=new PageInfo<Collection>(clist);
	 EUDataGridResult result = new EUDataGridResult();
	 result.setRows(clist);
	 result.setPageinfo(p);
	 System.out.println(result);
	return result;
}

public Collection getCollectionByIid(Integer id) {//����ղ���Ʒ��id��ѯ��Ʒ
	CollectionExample example = new CollectionExample();
	Criteria criteria = example.createCriteria();
	 criteria.andIidEqualTo(id);
	 List<Collection> clist = collectionmapper.selectByExample(example);
	 System.out.println(clist);
	 if(clist.size()<1)
	 {
		 return null;
	 }
	 else
	 {
		 return clist.get(0);
	 }
	// TODO Auto-generated method stub
	
}

public int insert(Collection collection) {
	// TODO Auto-generated method stub
	return collectionmapper.insert(collection);
}


}
