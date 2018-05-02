package com.art.portal.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.art.pojo.SearchResult;
import com.art.portal.service.SearchService;
import com.art.util.ArtResult;
import com.art.util.HttpClientUtil;

@Service
public class SearchServiceImpl implements SearchService{

	@Value("${SEARCH_BASE_URL}")
	private String SEARCH_BASE_URL;
	/**
	 * 
	 */
	public ArtResult search(String queryString, int page) {
		// 调用taotao-search的服务
				//查询参数
				Map<String, String> param = new HashMap<>();
				param.put("q", queryString);
				param.put("page", page + "");
				try {
					//调用服务
					String json = HttpClientUtil.doGet(SEARCH_BASE_URL, param);
					//把字符串转换成java对象
					ArtResult artResult = ArtResult.formatToPojo(json, SearchResult.class);
					return artResult;
				} catch (Exception e) {
					e.printStackTrace();
				}
				return null;
	}

}
