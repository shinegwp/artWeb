package com.art.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.pojo.TbItemParamItem;
import com.art.service.TbItemParamItemService;
import com.art.util.ArtResult;

@Controller
public class TbItemParamItemController {

	@Autowired
	private TbItemParamItemService tbItemParamItemService;
	
	@RequestMapping("restitemparamitemquery")
	@ResponseBody
public ArtResult getTbItemParam(Integer id)
{
	TbItemParamItem tbitemparamItem = tbItemParamItemService.selectTbItemParamItemServiceById(id);
	ArtResult result = new ArtResult();
	if(tbitemparamItem!=null)
	{
		result.setData(tbitemparamItem);
		result.setStatus(200);
	}
	return result;
}
}
