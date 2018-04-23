package com.art.service;

import com.art.pojo.OrderForm;
import com.art.pojo.OrderFormWithBLOBs;
import com.art.util.EUDataGridResult;

public interface OrderFormService {

	EUDataGridResult getOrderFormByUidAndPage(Integer uid, Integer page, Integer rows);

	int updateOrderFormById(OrderForm orderform);

	OrderForm getOrderFormListById(Integer id);

	EUDataGridResult getReturnOrderFormListByPage(Integer uid, Integer page, Integer rows, String state);

	int insert(OrderFormWithBLOBs orderform);

}
