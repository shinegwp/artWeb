package com.art.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.LetterMapper;
import com.art.pojo.Letter;
import com.art.pojo.LetterExample;
import com.art.pojo.LetterExample.Criteria;
import com.art.service.LetterService;
import com.art.util.EUDataGridResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class LetterServiceImpl implements LetterService {
@Autowired
LetterMapper letterMapper;

public EUDataGridResult getLetterListByPage(String utop, int page, int rows,String email,String uorp) {
System.out.println(uorp);
	LetterExample example = new LetterExample() ;
	Criteria criteria = example .createCriteria();
	if(utop!=null)
	{
		criteria.andUtopEqualTo(utop);
	}
	if("0".equals(uorp))
	{
		criteria.andPemailEqualTo(email);
	}
	if("1".equals(uorp))
	{
		criteria.andUemailEqualTo(email);
	}
	PageHelper.startPage(page, rows); 
	List<Letter> olist = letterMapper.selectByExampleWithBLOBs(example);
	System.out.println(olist);
	SimpleDateFormat simpledate = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
	List<String> list = new ArrayList<String>();
	for(Letter of:olist)
	{
		list.add(simpledate.format(of.getTime()));
	}
	 PageInfo<Letter> p=new PageInfo<Letter>(olist);
	 EUDataGridResult result = new EUDataGridResult();
	 result.setRows(olist);
	 result.setPageinfo(p);
	 result.setTime(list);
	 System.out.println(result);
	return result;
}

public int insert(Letter ul) {
	int i = letterMapper.insert(ul);
	return i;
}

public EUDataGridResult getLetterById(int parseInt) {
	List<Letter> ulist = new ArrayList<Letter>();
	Letter ul = letterMapper.selectByPrimaryKey(parseInt);
	ulist.add(ul);
	SimpleDateFormat simpledate = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
	List<String> list = new ArrayList<String>();
	list.add(simpledate.format(ul.getTime()));
	 EUDataGridResult result = new EUDataGridResult();
	 result.setRows(ulist);
	 result.setTime(list);
	return result;
}

}
