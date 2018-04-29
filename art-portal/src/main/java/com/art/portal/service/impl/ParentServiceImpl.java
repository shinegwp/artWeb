package com.art.portal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.art.pojo.ArtContent;
import com.art.pojo.Parent;
import com.art.pojo.ParentExample;
import com.art.portal.service.ParentService;
import com.art.util.EUDataGridResult;
import com.art.util.HttpClientUtil;
import com.art.util.JsonUtils;
import com.art.util.TaotaoResult;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class ParentServiceImpl implements ParentService{
	
	@Value("${REST_BASE_URL}")
	private String REST_BASE_URL;
	@Value("${REST_INDEX_PARENT_URL}")
	private String REST_INDEX_PARENT_URL;
	
	public String getParrentListByPage(int page, int rows) {
		String result = HttpClientUtil.doGet(REST_BASE_URL + REST_INDEX_PARENT_URL);
		//把字符串转换成TaotaoResult
		try {
			TaotaoResult taotaoResult = TaotaoResult.formatToList(result, Parent.class);
			//取内容列表
			List<Parent> list = (List<Parent>) taotaoResult.getData();
			
			return JsonUtils.objectToJson(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
