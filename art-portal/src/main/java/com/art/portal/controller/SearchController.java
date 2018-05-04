package com.art.portal.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.art.pojo.SearchResult;
import com.art.pojo.Solr_Item;
import com.art.portal.service.SearchService;
import com.art.util.ArtResult;
import com.art.util.JsonUtils;

@Controller
public class SearchController {
	
	@Autowired
	private SearchService searchService;
	
	@RequestMapping("/search")
	public ModelAndView search(@RequestParam("q")String queryString, @RequestParam(defaultValue="1")Integer page) {
		ArtResult artResult = searchService.search(queryString, page);
		SearchResult result = (SearchResult) artResult.getData();
		result.setQueryString(queryString);
		List<Solr_Item> slist = result.getItemList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SearchResult", JsonUtils.objectToJson(result));
		return new ModelAndView("search",map);
	}

}
