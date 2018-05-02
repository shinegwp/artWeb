package com.art.portal.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.art.portal.service.ContentService;
import com.art.portal.service.SolrService;

public class SolrController {
   
	@Autowired
	private SolrService solrService;
	
	
	@RequestMapping(value ="/gotoSolr")
	@ResponseBody
	public String gotoSolr(Integer page,String q) 
	{  solrService.gotoSolr(page, q);
	 return null;
	}
}
