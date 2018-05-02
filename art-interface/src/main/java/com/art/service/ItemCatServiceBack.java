package com.art.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.art.util.EUTreeNode;

public interface ItemCatServiceBack {

	//List<EUTreeNode> getCatList(@RequestParam(value="id",defaultValue="0")long parentId);

	List<EUTreeNode> getItemCatList(long parentId);
}
