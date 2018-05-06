package com.art.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.mapper.TbItemParamItemMapper;
import com.art.pojo.TbItemParamItem;
import com.art.service.TbItemParamItemService;
@Service
public class TbItemParamItemServiceImpl implements TbItemParamItemService {
@Autowired
TbItemParamItemMapper tbItemparamitemmapper;
	public TbItemParamItem selectTbItemParamItemServiceById(Integer id) {
		
		return tbItemparamitemmapper.selectByPrimaryKey((long)id);
	}

}
