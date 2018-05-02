package com.art.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.art.service.ItemCatService;
import com.art.service.ItemCatServiceBack;
import com.art.util.EUTreeNode;


@Controller

public class ItemCatControllerBack {
	
	@Autowired
	private ItemCatServiceBack itemcatserviceback;
	
	/**
	 * @describe 用于返回后台添加商品的类目选择需要的EUTreeNode
	 * @param parentId 父类的Id
	 * @return EUTreeNode
	 */
	@RequestMapping("itemcatlist")
	@ResponseBody
	private List<EUTreeNode> getCatList(@RequestParam(value="id",defaultValue="0")long parentId) {
		List<EUTreeNode> list = itemcatserviceback.getItemCatList(parentId);
		return list;
	}

}
