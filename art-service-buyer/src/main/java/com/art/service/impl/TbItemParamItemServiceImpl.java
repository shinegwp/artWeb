package com.art.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.TbItemParamItemMapper;
import com.art.pojo.TbItemParamItem;
import com.art.service.TbItemParamItemService;
@Service
public class TbItemParamItemServiceImpl implements TbItemParamItemService {
@Autowired
TbItemParamItemMapper tbItemParamItemMapper;
	public TbItemParamItem selectTbItemParamItemServiceById(Integer id) {
		
		return tbItemParamItemMapper.selectByPrimaryKey((long)id);
	}

}
