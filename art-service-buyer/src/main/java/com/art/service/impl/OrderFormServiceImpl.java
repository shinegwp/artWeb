package com.art.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.OrderFormMapper;
import com.art.pojo.OrderForm;
import com.art.pojo.OrderFormExample;
import com.art.pojo.OrderFormExample.Criteria;
import com.art.pojo.OrderFormWithBLOBs;
import com.art.service.OrderFormService;
import com.art.util.EUDataGridResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class OrderFormServiceImpl implements OrderFormService {
	 @Autowired 
	 OrderFormMapper orderFormMapper;
	public EUDataGridResult getOrderFormByUidAndPage(Integer uid, Integer page, Integer rows) {
		OrderFormExample example = new OrderFormExample();
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(uid);
		PageHelper.startPage(page, rows); 
		List<OrderFormWithBLOBs> olist = orderFormMapper.selectByExampleWithBLOBs(example);//.selectByExample(example);
		SimpleDateFormat simpledate = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
		List<String> list = new ArrayList<String>();
		for(OrderForm of:olist)
		{
			list.add(simpledate.format(of.getTime()));
		}
		 PageInfo<OrderFormWithBLOBs> p=new PageInfo<OrderFormWithBLOBs>(olist);
		 EUDataGridResult result = new EUDataGridResult();
		 result.setRows(olist);
		 result.setPageinfo(p);
		 result.setTime(list);
		 System.out.println(result);
		return result;
	}
	public EUDataGridResult getReturnOrderFormListByPage(Integer uid, Integer page, Integer rows,String state) {
		OrderFormExample example = new OrderFormExample();
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(uid);
		criteria.andStateEqualTo(state);
		PageHelper.startPage(page, rows); 
		List<OrderForm> olist = orderFormMapper.selectByExample(example);
		System.out.println(olist);
		SimpleDateFormat simpledate = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
		List<String> list = new ArrayList<String>();
		for(OrderForm of:olist)
		{
			list.add(simpledate.format(of.getTime()));
		}
		 PageInfo<OrderForm> p=new PageInfo<OrderForm>(olist);
		 EUDataGridResult result = new EUDataGridResult();
		 result.setRows(olist);
		 result.setPageinfo(p);
		 result.setTime(list);
		 System.out.println(result);
		return result;
	}
	public int updateOrderFormById(OrderForm orderform) {
		{
		
		OrderForm orderform1= orderFormMapper.selectByPrimaryKey(orderform.getId());
		orderform1.setState(orderform.getState());
		int i = orderFormMapper.updateByPrimaryKey(orderform1);
		return i;
		
	}
	}
	public OrderForm getOrderFormListById(Integer id) {
		OrderForm orderform = orderFormMapper.selectByPrimaryKey(id);
		return orderform;
	}
	public int insert(OrderFormWithBLOBs orderform) {
		return orderFormMapper.insertSelective(orderform);
		
	}
	
}
