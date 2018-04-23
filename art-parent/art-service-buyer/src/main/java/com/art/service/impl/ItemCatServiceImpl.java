package com.art.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.ItemCatMapper;
import com.art.mapper.ItemImg1Mapper;
import com.art.mapper.ItemMapper;
import com.art.pojo.ItemCat;
import com.art.pojo.ItemCatExample;
import com.art.pojo.ItemCatExample.Criteria;
import com.art.pojo.ItemExample;
import com.art.service.ItemCatService;
import com.art.util.EUTreeNode;
@Service
public class ItemCatServiceImpl implements ItemCatService {
	@Autowired ItemCatMapper itemcatmapper;
	
	public List<EUTreeNode> getItemCatList(long parentId) {
		ItemCatExample example = new ItemCatExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		List<ItemCat> catlist = itemcatmapper.selectByExample(example);
		List<EUTreeNode> eutlist = new ArrayList<EUTreeNode>();
		for(ItemCat list:catlist)
		{
			EUTreeNode eutn = new EUTreeNode();
			eutn.setId(list.getId());
			eutn.setText(list.getName());
			eutn.setState(list.getIsParent()?"closed":"open");
			eutlist.add(eutn);
		}
		return eutlist;
	}

}
