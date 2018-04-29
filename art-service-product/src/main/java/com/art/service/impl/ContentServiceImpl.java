
package com.art.service.impl;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.art.mapper.ArtContentMapper;
import com.art.pojo.ArtContent;
import com.art.pojo.ArtContentExample;
import com.art.pojo.Item;
import com.art.pojo.ItemExample;
import com.art.pojo.ArtContentExample.Criteria;
import com.art.service.ContentService;
import com.art.util.EUDataGridResult;
import com.art.util.TaotaoResult;
import com.github.pagehelper.PageHelper;



/**
 * 内容管理
 * <p>Title: ContentServiceImpl</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	入云龙
 * @date	2015年9月8日上午11:09:53
 * @version 1.0
 */
@Service
public class ContentServiceImpl implements ContentService {

	@Autowired
	private ArtContentMapper  contentMapper;
	@Value("${REST_BASE_URL}")
	private String REST_BASE_URL;
	@Value("${REST_CONTENT_SYNC_URL}")
	private String REST_CONTENT_SYNC_URL;
	
	

	public TaotaoResult insertContent(ArtContent content) {
		//补全pojo内容
		content.setCreated(new Date());
		content.setUpdated(new Date());
		contentMapper.insert(content);
		
		//添加缓存同步逻辑
//		try {
//			HttpClientUtil.doGet(REST_BASE_URL + REST_CONTENT_SYNC_URL + content.getCategoryId());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		return TaotaoResult.ok();
	}


	public EUDataGridResult selectContentByCategoryIdAndPage(Long categoryId, int page,int rows) {
		EUDataGridResult eudgr = new  EUDataGridResult();
		ArtContentExample example = new ArtContentExample();
		PageHelper.startPage(page, rows);
		Criteria criteria = example.createCriteria();
		criteria.andCategoryIdEqualTo(categoryId);
		List<ArtContent> list = contentMapper.selectByExample(example );
		eudgr.setRows(list);
		return eudgr;
	}

}
