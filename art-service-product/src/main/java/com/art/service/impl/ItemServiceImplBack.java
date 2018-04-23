package com.art.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.art.mapper.ItemMapper;
import com.art.pojo.Item;
import com.art.pojo.ItemExample;
import com.art.pojo.ItemExample.Criteria;
import com.art.service.ItemServiceBack;
import com.art.util.EUDataGridResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
@Component
public class ItemServiceImplBack implements ItemServiceBack{
	@Autowired
	 ItemMapper itemMapper;
	public int ReshelfItem(Integer id) {//后台
		ItemExample example = new ItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(id);
		Item item = new Item();
		item.setStatus(1);
		int i = itemMapper.updateByExampleSelective(item, example);
		return i;
	}
	public int deleteItemById(Integer id) {//后台
		int i = itemMapper.deleteByPrimaryKey(id);
		return i;
	}
	public int insertItem(Item item) {//前后台都有
		int i = itemMapper.insertSelective(item);
		return i;
	}
	public EUDataGridResult getItemList(int page, int rows) {//前后台都有
		ItemExample example = new ItemExample();
		//鍒嗛〉澶勭悊
		PageHelper.startPage(page, rows);
		List<Item> list = itemMapper.selectByExample(example);
		System.out.println(list);
		//鍒涘缓涓�涓繑鍥炲�煎璞�
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		//鍙栬褰曟�绘潯鏁�
		PageInfo<Item> pageInfo = new PageInfo<Item>(list);

		result.setTotal(pageInfo.getTotal());;
		


		
		return result;
	}
	public Item getItemById(String id) {//前后台都有
		// TODO Auto-generated method stub
		return itemMapper.selectByPrimaryKey(Integer.parseInt(id));
	}

}
