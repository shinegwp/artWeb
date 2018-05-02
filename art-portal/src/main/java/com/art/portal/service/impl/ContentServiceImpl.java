package com.art.portal.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.art.pojo.ArtContent;
import com.art.portal.service.ContentService;
import com.art.util.HttpClientUtil;
import com.art.util.JsonUtils;
import com.art.util.ArtResult;


/**
 * 调用服务层服务，查询内容列表
 * <p>Title: ContentServiceImpl</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	入云龙
 * @date	2015年9月8日下午5:08:38
 * @version 1.0
 */
@Service
public class ContentServiceImpl implements ContentService {

	@Value("${REST_BASE_URL}")
	private String REST_BASE_URL;
	@Value("${REST_INDEX_AD_URL}")
	private String REST_INDEX_AD_URL;
	public String getContentList(int categoryId) {
		System.out.println("categoryId="+REST_BASE_URL + REST_INDEX_AD_URL+categoryId);
		//调用服务层的服务
		String result = HttpClientUtil.doGet(REST_BASE_URL + REST_INDEX_AD_URL+categoryId);
		System.out.println(result);
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
