package com.art.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfig;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import com.art.mapper.ItemMapper;
import com.art.pojo.Item;
import com.art.pojo.ItemExample;
import com.art.pojo.ItemExample.Criteria;
import com.art.service.ItemServiceBack;
import com.art.util.EUDataGridResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import freemarker.template.Template;

@Service
@Component
public class ItemServiceImplBack implements ItemServiceBack{
	@Autowired
	 ItemMapper itemMapper;
	@Autowired 
	private FreeMarkerConfigurer freeMarkerConfigurer;//静态化页面工具类
	
	
	public int ReshelfItem(Integer id) {//后台
		ItemExample example = new ItemExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdEqualTo(id);
		Item item = itemMapper.selectByPrimaryKey(id);
		
		
		Writer out = null;
		try {
			File outFile = new File("C:/trainSW/workT/artWeb/art-portal/src/main/webapp/WEB-INF/jsp/item-html");
			out = new OutputStreamWriter(new FileOutputStream(outFile));
			
			//获取模板所在路径
//			Template template = freeMarkerConfigurer.createConfiguration().getTemplate("");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
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
		
		PageHelper.startPage(page, rows);
		List<Item> list = itemMapper.selectByExample(example);
		System.out.println(list);
		
		EUDataGridResult result = new EUDataGridResult();
		result.setRows(list);
		
		PageInfo<Item> pageInfo = new PageInfo<Item>(list);

		result.setTotal(pageInfo.getTotal());;
		


		
		return result;
	}
	public Item getItemById(String id) {//前后台都有
		// TODO Auto-generated method stub
		return itemMapper.selectByPrimaryKey(Integer.parseInt(id));
	}

}
