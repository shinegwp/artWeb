package com.art.rest.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.art.mapper.ArtContentMapper;
import com.art.mapper.ParentMapper;
import com.art.pojo.ArtContent;
import com.art.pojo.ArtContentExample;
import com.art.pojo.Parent;
import com.art.pojo.ParentExample;
import com.art.pojo.ArtContentExample.Criteria;
import com.art.rest.dao.JedisClient;
import com.art.rest.service.ParentService;
import com.art.util.ArtResult;
import com.art.util.EUDataGridResult;
import com.art.util.JsonUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class ParentServiceImpl implements ParentService{
	@Autowired
	ParentMapper parentmapper;
	
	@Autowired
	private JedisClient jedisClient;
	
	@Value("${INDEX_CONTENT_REDIS_KEY}")
	private String INDEX_CONTENT_REDIS_KEY;
	
	public ArtResult getParentListByPage(int page, int rows) {

         		//从缓存中取内容
				try {
					String result = jedisClient.hget(INDEX_CONTENT_REDIS_KEY, page + "");
					if (!StringUtils.isBlank(result)) {
						//把字符串转换成list
						ArtResult aresult = (ArtResult) JsonUtils.jsonToPojo(result, ArtResult.class);
						//ArtResult aresult = new ArtResult(map.get("p"),(List<Parent>)map.get("plist"));
								
						return aresult;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				//开启分页插件
				PageHelper.startPage(page, rows); 
				ParentExample example = new ParentExample() ;
				//开始查询
				List<Parent> plist = parentmapper.selectByExample(example );
		
				PageInfo<Parent> p=new PageInfo<Parent>(plist);
				//将页面信息和查询的list封装到ArtResult
				 ArtResult result = new ArtResult(p);
				
				//向缓存中添加内容
				try {
					//把list转换成字符串
					String cacheString = JsonUtils.objectToJson(result);
					jedisClient.hset(INDEX_CONTENT_REDIS_KEY,   "parent-p"+String.valueOf(page)+"r"+String.valueOf(rows), cacheString);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return result;
	
	}

}
