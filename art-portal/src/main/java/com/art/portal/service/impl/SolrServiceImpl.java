package com.art.portal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;

import com.art.pojo.ArtContent;
import com.art.portal.service.SolrService;
import com.art.util.ArtResult;
import com.art.util.HttpClientUtil;
import com.art.util.JsonUtils;

public class SolrServiceImpl implements SolrService {
	@Value("${SOLR_BASE_URL}")
	private String SOLR_BASE_URL;
	@Value("${SOLR_QUERY_URL}")
	private String SOLR_QUERY_URL;
	
	public String gotoSolr(Integer page,String q) {
	//调用服务层的服务
	String result = HttpClientUtil.doGet(SOLR_BASE_URL +SOLR_QUERY_URL+"?page="+page+"&q="+q);
	System.out.println(result );
	//把字符串转换成ArtResult
	try {
		ArtResult artResult = ArtResult.formatToList(result, ArtContent.class);
		//取内容列表
		List<ArtContent> list = (List<ArtContent>) artResult.getData();
		
		return JsonUtils.objectToJson(list);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return null;
}
}
