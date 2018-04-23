package com.art.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.ParentMapper;
import com.art.pojo.Letter;
import com.art.pojo.Parent;
import com.art.pojo.ParentExample;
import com.art.pojo.ParentExample.Criteria;
import com.art.service.ParentService;
import com.art.util.EUDataGridResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class ParentServiceImpl implements ParentService{
@Autowired
ParentMapper parentmapper;

	public List<Parent> getParents() {
		ParentExample example = new ParentExample();
		List<Parent> list = parentmapper.selectByExample(example);
		System.out.println("serviceImpl"+list);
		return list;
	}

	public EUDataGridResult getParrentListByPage(int parseInt, int parseInt2) {
		PageHelper.startPage(parseInt, parseInt2); 
		ParentExample example = new ParentExample() ;
		List<Parent> plist = parentmapper.selectByExample(example );
		PageInfo<Parent> p=new PageInfo<Parent>(plist);
		EUDataGridResult result = new EUDataGridResult();
		 result.setRows(plist);
		 result.setPageinfo(p);
	
		
		return result;
	}

}
