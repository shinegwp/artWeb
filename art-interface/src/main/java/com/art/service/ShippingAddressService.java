package com.art.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.art.pojo.ShippingAddress;


public interface ShippingAddressService  {

	List<ShippingAddress> getShippingAddressByUid(Integer uid);

	int  updata(ShippingAddress sa);

	public ShippingAddress getShippingAddressById(Integer id);

	Integer deleteShippingAddressById(Integer id);

}
