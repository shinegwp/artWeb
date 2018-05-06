package com.art.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.art.mapper.ItemImg2Mapper;
import com.art.pojo.ItemImg2;
import com.art.pojo.ItemImg2Example;
import com.art.pojo.ItemImg2Example.Criteria;
import com.art.service.ItemImg2Service;

@Service
public class ItemImg2ServiceImpl implements ItemImg2Service {
	@Autowired ItemImg2Mapper itemimgmapper2;
	public List<ItemImg2> getItemImg2ById(Integer id) {
		ItemImg2Example example = new ItemImg2Example();
		Criteria criteria = example.createCriteria();
		criteria.andIidEqualTo(id);
		List<ItemImg2> itemimg2 = itemimgmapper2.selectByExample(example);
		return itemimg2;
	}
}
