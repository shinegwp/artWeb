package com.art.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.OrderFormMapper;
import com.art.pojo.OrderForm;
import com.art.pojo.OrderFormExample;
import com.art.pojo.OrderFormWithBLOBs;
import com.art.pojo.ShippingAddress;
import com.art.service.OrderFormService;
import com.art.util.ArtResult;
import com.art.util.EUDataGridResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class OrderFormServiceImpl implements OrderFormService {
	 @Autowired 
	 OrderFormMapper orderFormMapper;
	 /**
	  * 插入订单
	  */
	public int creatOrderForm(OrderFormWithBLOBs orderform) {
	     int i = orderFormMapper.insert(orderform);
		return  i;
	}

	
}
