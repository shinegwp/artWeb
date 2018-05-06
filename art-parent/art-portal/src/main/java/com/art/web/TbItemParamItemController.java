package com.art.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.TbItemParamItem;
import com.art.service.ItemCatService;
import com.art.service.TbItemParamItemService;
import com.art.util.TaotaoResult;

@Controller
public class TbItemParamItemController {

	@Autowired
	private TbItemParamItemService Tbitemparamitemservice;
	
	@RequestMapping("restitemparamitemquery")
	@ResponseBody
public TaotaoResult getTbItemParam(Integer id)
{
	TbItemParamItem tbitemparamItem = Tbitemparamitemservice.selectTbItemParamItemServiceById(id);
	TaotaoResult result = new TaotaoResult();
	if(tbitemparamItem!=null)
	{
		result.setData(tbitemparamItem);
		result.setStatus(200);
	}
	return result;
}
}
