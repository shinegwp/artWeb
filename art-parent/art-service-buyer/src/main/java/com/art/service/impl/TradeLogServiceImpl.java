package com.art.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.TradeLogMapper;
import com.art.pojo.Collection;
import com.art.pojo.CollectionExample;
import com.art.pojo.TradeLog;
import com.art.pojo.TradeLogExample;
import com.art.pojo.TradeLogExample.Criteria;
import com.art.service.TradeLogService;
import com.art.util.EUDataGridResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class TradeLogServiceImpl implements TradeLogService {
@Autowired 
TradeLogMapper tradelogmapper;
	public List<TradeLog> getTradeLogListByUid(Integer uid) {
		TradeLogExample example = new TradeLogExample() ;
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(uid);
		List<TradeLog> trlist = tradelogmapper.selectByExample(example );
		return trlist;
	}
	public EUDataGridResult getTradeLoglistByUidAndPage(Integer uid, Integer page, Integer rows) {
		TradeLogExample example = new TradeLogExample();
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(uid);
		PageHelper.startPage(page, rows); 
		List<TradeLog> clist = tradelogmapper.selectByExample(example);
		SimpleDateFormat simpledate = new SimpleDateFormat("MM-dd-yyyy");
		List<String> list = new ArrayList<String>();
		for(TradeLog tr:clist)
		{
			list.add(simpledate.format(tr.getTradeTime()));
		}
		 PageInfo<TradeLog> p=new PageInfo<TradeLog>(clist);
		 EUDataGridResult result = new EUDataGridResult();
		 result.setRows(clist);
		 result.setPageinfo(p);
		 result.setTime(list);
		 System.out.println(result);
		return result;
	}
	public int insert(TradeLog tl) {
		int i = tradelogmapper.insert(tl);
		System.out.println("insertlog="+i);
		return i;
	}

}
