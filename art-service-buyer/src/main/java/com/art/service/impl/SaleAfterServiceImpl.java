package com.art.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.SaleAfterMapper;
import com.art.pojo.SaleAfter;
import com.art.service.SaleAfterService;

@Service
public class SaleAfterServiceImpl implements SaleAfterService{

@Autowired
SaleAfterMapper saleAfterMapper;

public int save(SaleAfter saleafter) {
	// TODO Auto-generated method stub
	System.out.println(saleAfterMapper);
	return saleAfterMapper.insertSelective(saleafter);
}


}
