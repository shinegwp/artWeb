package com.art.service;

import com.art.pojo.ArtContent;
import com.art.util.EUDataGridResult;
import com.art.util.ArtResult;

public interface ContentService {

	ArtResult insertContent(ArtContent content);

	EUDataGridResult selectContentByCategoryIdAndPage(Long categoryId, int page, int rows);
}
