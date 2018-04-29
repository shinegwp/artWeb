package com.art.solr.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.solr.service.Solr_ItemService;
import com.art.util.ArtResult;

@Controller
@RequestMapping("/manager")
public class Solr_ItemController {
	
	@Autowired
	private Solr_ItemService itemService;

	/**
	 * 导入商品数据到索引库
	 */
	@RequestMapping("/importall")
	@ResponseBody
	public ArtResult importAllItems() {
		ArtResult result = itemService.importAllItems();
		return result;
	}
	
	

}
