package com.art.service;

import java.util.List;

import com.art.pojo.Refer;
import com.art.util.EUDataGridResult;
import com.github.pagehelper.PageInfo;

public interface ReferService {
	public  EUDataGridResult getReferlistByUidAndPage(Integer uid,Integer page,Integer rows);

	public int saveRefer(Refer rf);
}
