package com.art.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.ReferMapper;
import com.art.pojo.Refer;
import com.art.pojo.ReferExample;
import com.art.pojo.ReferExample.Criteria;
import com.art.service.ReferService;
import com.art.util.EUDataGridResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class ReferServiceImpl implements ReferService {
    @Autowired 
    ReferMapper referMapper;

	public  EUDataGridResult getReferlistByUidAndPage(Integer uid, Integer page, Integer rows) {
		ReferExample example = new ReferExample();
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(uid);
		PageHelper.startPage(page, rows); 
		List<Refer> rlist = referMapper.selectByExample(example);
		 PageInfo<Refer> p=new PageInfo<Refer>(rlist);
		 EUDataGridResult result = new EUDataGridResult();
		 result.setRows(rlist);
		 result.setPageinfo(p);
		 System.out.println(result);
		return result;
	}

	public int saveRefer(Refer rf) {
		
		return referMapper.insertSelective(rf);
	}


}
