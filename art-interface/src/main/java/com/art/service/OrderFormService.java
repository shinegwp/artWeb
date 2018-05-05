package com.art.service;

import java.util.List;

import com.art.pojo.OrderForm;
import com.art.pojo.OrderFormWithBLOBs;
import com.art.pojo.ShippingAddress;
import com.art.util.EUDataGridResult;

public interface OrderFormService {

	int creatOrderForm(OrderFormWithBLOBs orderform);

}
