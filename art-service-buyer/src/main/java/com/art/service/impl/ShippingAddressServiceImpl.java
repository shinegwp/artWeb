package com.art.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.ShippingAddressMapper;
import com.art.pojo.ShippingAddress;
import com.art.pojo.ShippingAddressExample;
import com.art.pojo.ShippingAddressExample.Criteria;
import com.art.service.ShippingAddressService;

@Service
public class ShippingAddressServiceImpl implements ShippingAddressService {
@Autowired
ShippingAddressMapper shippingAddressMapper;
	public List<ShippingAddress> getShippingAddressByUid(Integer uid) {
		ShippingAddressExample example = new ShippingAddressExample() ;
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(uid);
		List<ShippingAddress> list = shippingAddressMapper.selectByExample(example );
		return list;
		
	}
	public int updata(ShippingAddress sa) {
		ShippingAddressExample example = new ShippingAddressExample();
		example.createCriteria();
		int i =0;
		System.out.println(sa);
		if(sa.getId()==null)
		{
			i=shippingAddressMapper.insert(sa);
		}
		else
		{
			i = shippingAddressMapper.updateByPrimaryKeySelective(sa);//.updateByExampleSelective(sa, example );
		}
		 
		System.out.println("service"+i);
		return i;
	}
	public ShippingAddress getShippingAddressById(Integer id) {
		ShippingAddress sa = shippingAddressMapper.selectByPrimaryKey(id);
		System.out.println(sa);
		return sa;
	}
	public Integer deleteShippingAddressById(Integer id) {
	    
		return shippingAddressMapper.deleteByPrimaryKey(id);
	}
	
	

} 