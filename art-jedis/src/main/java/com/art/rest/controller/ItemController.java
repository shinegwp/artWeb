package com.art.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.rest.service.ContentService;
import com.art.rest.service.ItemService;
import com.art.util.ArtResult;
@Controller
@RequestMapping("/item")
public class ItemController {
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/info/{itemId}")
	@ResponseBody
	public ArtResult getItemBaseInfo(@PathVariable Long itemId) {
		ArtResult result = itemService.getItemBaseInfo(itemId);
		return result;
	}
	
}
