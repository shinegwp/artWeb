package com.art.service;

import com.art.pojo.ArtContent;
import com.art.util.EUDataGridResult;
import com.art.util.TaotaoResult;

public interface ContentService {

	TaotaoResult insertContent(ArtContent content);

	EUDataGridResult selectContentByCategoryIdAndPage(Long categoryId, int page, int rows);
}
