package com.art.rest.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.art.mapper.ItemMapper;
import com.art.pojo.Item;
import com.art.rest.dao.JedisClient;
import com.art.rest.service.ItemService;
import com.art.util.ArtResult;
import com.art.util.JsonUtils;


@Service
public class ItemServiceImpl implements ItemService {

	@Value("${REDIS_ITEM_KEY}")
	private String REDIS_ITEM_KEY;
	@Value("${REDIS_ITEM_EXPIRE}")
	private Integer REDIS_ITEM_EXPIRE;
	
	@Autowired
	private JedisClient jedisClient;
	
	@Autowired
	private  ItemMapper itemMapper;
	public ArtResult getItemBaseInfo(long itemId) {
		try {
			//添加缓存逻辑
			//从缓存中取商品信息，商品id对应的信息
			String json = jedisClient.get(REDIS_ITEM_KEY + ":" + itemId + ":base");
			//判断是否有值
			if (!StringUtils.isBlank(json)) {
				//把json转换成java对象
				Item item = JsonUtils.jsonToPojo(json, Item.class);
				return ArtResult.ok(item);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//根据商品id查询商品信息
		Item item =  itemMapper.selectByPrimaryKey((int) itemId);
		System.out.println("jedis里查到的item="+item);
		//使用ArtResult包装一下
		try {
			//把商品信息写入缓存
			jedisClient.set(REDIS_ITEM_KEY + ":" + itemId + ":base", JsonUtils.objectToJson(item));
			//设置key的有效期
			jedisClient.expire(REDIS_ITEM_KEY + ":" + itemId + ":base", REDIS_ITEM_EXPIRE);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ArtResult.ok(item);
	}
}
