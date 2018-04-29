package com.art.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.art.portal.service.ContentService;

@Controller
public class ContentController {
	
	@Autowired
	private ContentService contentService;

	@RequestMapping(value ="getContent",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String showIndex(int categoryId) {
		return contentService.getContentList(categoryId);
	}
	
	@RequestMapping(value="/httpclient/post", method=RequestMethod.POST, 
			produces=MediaType.TEXT_PLAIN_VALUE+";charset=utf-8")
	@ResponseBody
	public String testPost(String username, String password) {
		String result = "username:" + username + "\tpassword:" + password;
		System.out.println(result);
		return "username:" + username + ",password:" + password;
	}
}
