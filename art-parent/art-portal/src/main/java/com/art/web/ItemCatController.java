package com.art.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.art.service.ItemCatService;
import com.art.util.EUTreeNode;


@Controller

public class ItemCatController {
	
	@Autowired
	private ItemCatService itemcatcervice;
	
	@RequestMapping("itemcatlist")
	@ResponseBody
	private List<EUTreeNode> getCatList(@RequestParam(value="id",defaultValue="0")long parentId) {
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5");
		List<EUTreeNode> list = itemcatcervice.getItemCatList(parentId);
		System.out.println(list);
		return list;
	}
	
	@RequestMapping("itemparamqueryitemcatid")
	@ResponseBody
	private String ItemQuery() {
		System.out.println("ItemQuery%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5");
		
	return "200";
	}
	
}
