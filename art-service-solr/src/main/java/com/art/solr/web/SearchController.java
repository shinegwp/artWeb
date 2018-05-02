package com.art.solr.web;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.solr.pojo.SearchResult;
import com.art.solr.service.SearchService;
import com.art.util.ArtResult;
import com.art.util.ExceptionUtil;

@Controller
public class SearchController {

	@Autowired
	private SearchService searchService;
	
	@RequestMapping(value="/query", method=RequestMethod.GET)
	@ResponseBody
	public ArtResult search(@RequestParam("q")String queryString, 
			@RequestParam(defaultValue="1")Integer page, 
			@RequestParam(defaultValue="9")Integer rows) {
		System.out.println("开始进入查询");
		//查询条件不能为空
		if (StringUtils.isBlank(queryString)) {
			return ArtResult.build(400, "查询条件不能为空");
		}
		SearchResult searchResult = null;
		try {
			queryString = new String(queryString.getBytes("iso8859-1"), "utf-8");
			searchResult = searchService.search(queryString, page, rows);
		} catch (Exception e) {
			e.printStackTrace();
			return ArtResult.build(500, ExceptionUtil.getStackTrace(e));
		}
		return ArtResult.ok(searchResult);
		
	}
	
}