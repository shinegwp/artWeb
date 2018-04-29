package com.art.service;

import java.util.List;

import com.art.util.EUTreeNode;
import com.art.util.ArtResult;


public interface ContentCategoryService {

	List<EUTreeNode> getCategoryList(long parentId);
	ArtResult insertContentCategory(long parentId, String name);
}
