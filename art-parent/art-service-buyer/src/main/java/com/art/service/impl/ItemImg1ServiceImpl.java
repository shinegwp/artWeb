package com.art.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.ItemImg1Mapper;
import com.art.pojo.ItemImg1;
import com.art.pojo.ItemImg1Example;
import com.art.pojo.ItemImg1Example.Criteria;
import com.art.service.ItemImg1Service;
@Service
public class ItemImg1ServiceImpl implements ItemImg1Service{
@Autowired ItemImg1Mapper itemimgmapper1;
	public List<ItemImg1> getItemImg1ById(Integer id) {
		ItemImg1Example example = new ItemImg1Example();
		Criteria criteria = example.createCriteria();
		criteria.andIidEqualTo(id);
		List<ItemImg1> itemimg1 = itemimgmapper1.selectByExample(example);
		return itemimg1;
	}

}
