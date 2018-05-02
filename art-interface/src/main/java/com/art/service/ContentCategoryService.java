package com.art.service;

import java.util.List;

import com.art.util.EUTreeNode;
import com.art.pojo.ArtContentCategory;
import com.art.util.ArtResult;


public interface ContentCategoryService {

	ArtContentCategory selectById(long parentId);
	List<EUTreeNode> getCategoryList(long id);
	ArtResult insertContentCategory(long parentId, String name);
	int deleteById(long id);
	int updateNameById(ArtContentCategory acc);
}
