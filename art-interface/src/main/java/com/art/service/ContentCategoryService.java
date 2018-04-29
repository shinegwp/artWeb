package com.art.service;

import java.util.List;

import com.art.util.EUTreeNode;
import com.art.util.TaotaoResult;


public interface ContentCategoryService {

	List<EUTreeNode> getCategoryList(long parentId);
	TaotaoResult insertContentCategory(long parentId, String name);
}
