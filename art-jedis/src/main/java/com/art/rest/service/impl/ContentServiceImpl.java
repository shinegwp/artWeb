package com.art.rest.service.impl;
  
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;


import com.art.mapper.ArtContentMapper;
import com.art.pojo.ArtContent;
import com.art.pojo.ArtContentExample;
import com.art.pojo.ArtContentExample.Criteria;
import com.art.rest.dao.JedisClient;
import com.art.rest.service.ContentService;
import com.art.util.JsonUtils;

import sun.tools.jar.resources.jar;
@Service
public class ContentServiceImpl implements ContentService {

	@Autowired
	private ArtContentMapper contentMapper;
	@Autowired
	private JedisClient jedisClient;
	@Value("${INDEX_CONTENT_REDIS_KEY}")
	private String INDEX_CONTENT_REDIS_KEY;
	
	public List<ArtContent> getContentList(long contentCid) {
		//从缓存中取内容
				try {
					String result = jedisClient.hget(INDEX_CONTENT_REDIS_KEY, contentCid + "");
					if (!StringUtils.isBlank(result)) {
						//把字符串转换成list
						List<ArtContent> resultList = JsonUtils.jsonToList(result, ArtContent.class);
						return resultList;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				//根据内容分类id查询内容列表
				ArtContentExample example = new ArtContentExample();
				Criteria criteria = example.createCriteria();
				criteria.andCategoryIdEqualTo(contentCid);
				//执行查询
				List<ArtContent> list = contentMapper.selectByExample(example);
				//向缓存中添加内容
				try {
					//把list转换成字符串
					String cacheString = JsonUtils.objectToJson(list);
					jedisClient.hset(INDEX_CONTENT_REDIS_KEY, contentCid + "", cacheString);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return list;
	}
	
	


}
